import subprocess
import json
from collections import defaultdict, Counter
from datetime import datetime, timedelta
import os
import html
import sqlite3
import shutil
from urllib.parse import urlparse

# =========================
# CONFIG
# =========================
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
OUTPUT_FILE = os.path.join(SCRIPT_DIR, "report.html")

WINDOW_MINUTES = 5
FAILED_THRESHOLD = 5

# =========================
# POWERSHELL RUNNER
# =========================
def run_powershell(cmd):
    result = subprocess.run(
        ["powershell", "-Command", cmd],
        capture_output=True,
        text=True
    )
    try:
        data = json.loads(result.stdout)
        if isinstance(data, dict):
            return [data]
        return data
    except:
        return []

# =========================
# HELPERS
# =========================
def extract_field(message, field):
    for line in message.split("\n"):
        if field in line:
            return line.split(":")[-1].strip()
    return "N/A"

# =========================
# FETCH WINDOWS EVENTS
# =========================
def get_events():
    return run_powershell(
        "Get-WinEvent -LogName Security -MaxEvents 200 | ConvertTo-Json -Depth 3"
    )

# =========================
# FETCH NETWORK CONNECTIONS
# =========================
def get_connections():
    data = run_powershell(
        "Get-NetTCPConnection | Select-Object LocalAddress,LocalPort,RemoteAddress,RemotePort,State,OwningProcess | ConvertTo-Json"
    )

    proc_map = {}
    try:
        tasklist = subprocess.run(["tasklist"], capture_output=True, text=True).stdout
        for line in tasklist.split("\n")[3:]:
            parts = line.split()
            if len(parts) > 1:
                proc_map[parts[1]] = parts[0]
    except:
        pass

    connections = []
    for c in data:
        pid = str(c.get("OwningProcess", ""))
        connections.append({
            "src": f"{c.get('LocalAddress')}:{c.get('LocalPort')}",
            "dst": f"{c.get('RemoteAddress')}:{c.get('RemotePort')}",
            "state": c.get("State"),
            "process": proc_map.get(pid, f"PID {pid}"),
            "protocol": "TCP"
        })

    return connections

# =========================
# ANALYZE EVENTS
# =========================
def analyze(events):
    alerts = []
    logins = []
    failed_tracker = defaultdict(list)

    now = datetime.now()

    for e in events:
        eid = e.get("Id")
        msg = e.get("Message", "")
        time = str(e.get("TimeCreated"))

        if eid == 4624:  # SUCCESS
            logins.append({
                "type": "SUCCESS",
                "user": extract_field(msg, "Account Name"),
                "ip": extract_field(msg, "Source Network Address"),
                "detail": f"Logon Type {extract_field(msg, 'Logon Type')}",
                "time": time
            })

        elif eid == 4625:  # FAILED
            user = extract_field(msg, "Account Name")
            ip = extract_field(msg, "Source Network Address")

            logins.append({
                "type": "FAILED",
                "user": user,
                "ip": ip,
                "detail": extract_field(msg, "Failure Reason"),
                "time": time
            })

            alerts.append({
                "title": "Failed Login",
                "desc": f"{user} failed from {ip}",
                "severity": "MEDIUM",
                "mitre": "T1110"
            })

            failed_tracker[ip].append(now)
            window = now - timedelta(minutes=WINDOW_MINUTES)
            failed_tracker[ip] = [t for t in failed_tracker[ip] if t > window]

            if len(failed_tracker[ip]) >= FAILED_THRESHOLD:
                alerts.append({
                    "title": "Brute Force Suspected",
                    "desc": f"{len(failed_tracker[ip])} failures from {ip}",
                    "severity": "HIGH",
                    "mitre": "T1110"
                })

        elif eid == 4720:  # USER CREATED
            alerts.append({
                "title": "User Created",
                "desc": f"{extract_field(msg, 'New Account Name')} created by {extract_field(msg, 'Account Name')}",
                "severity": "HIGH",
                "mitre": "T1136"
            })

    return alerts, logins

# =========================
# BROWSER HISTORY
# =========================
def get_browser_history():
    paths = [
        os.path.expanduser(r"~\AppData\Local\Google\Chrome\User Data\Default\History"),
        os.path.expanduser(r"~\AppData\Local\Microsoft\Edge\User Data\Default\History")
    ]

    history = []

    for path in paths:
        if not os.path.exists(path):
            continue

        temp_db = path + "_temp"
        try:
            shutil.copy2(path, temp_db)
            conn = sqlite3.connect(temp_db)
            cursor = conn.cursor()

            cursor.execute("""
                SELECT url, title, last_visit_time FROM urls
                ORDER BY last_visit_time DESC LIMIT 50
            """)

            for url, title, visit_time in cursor.fetchall():
                visit_time = datetime(1601, 1, 1) + timedelta(microseconds=visit_time)
                history.append({
                    "url": url,
                    "title": title,
                    "time": visit_time.strftime("%Y-%m-%d %H:%M:%S"),
                    "domain": urlparse(url).netloc
                })

            conn.close()
            os.remove(temp_db)

        except:
            pass

    return history

# =========================
# HISTORY ANALYSIS
# =========================
def analyze_history(history):
    domains = [h["domain"] for h in history if h["domain"]]
    top_domains = Counter(domains).most_common(10)

    suspicious_keywords = ["login", "verify", "secure", "update", "bank"]
    suspicious = [h for h in history if any(k in h["url"].lower() for k in suspicious_keywords)]

    return top_domains, suspicious

# =========================
# HTML REPORT
# =========================
def generate_html(alerts, logins, connections, history, top_domains, suspicious):
    html_content = """
    <html><head>
    <title>Security Dashboard</title>
    <style>
    body { font-family: Segoe UI; background:#0f172a; color:white; padding:20px; }
    h1 { color:#38bdf8; }
    table { width:100%; border-collapse:collapse; margin-top:20px; }
    th, td { padding:10px; border-bottom:1px solid #334155; }
    th { background:#1e293b; }
    .high { color:#ef4444; }
    .medium { color:#f59e0b; }
    </style></head><body>
    """

    # ALERTS
    html_content += "<h1>🚨 Security Alerts</h1><table><tr><th>Title</th><th>Description</th><th>Severity</th><th>MITRE</th></tr>"
    for a in alerts:
        html_content += f"<tr><td>{html.escape(a['title'])}</td><td>{html.escape(a['desc'])}</td><td class='{a['severity'].lower()}'>{a['severity']}</td><td>{a['mitre']}</td></tr>"
    html_content += "</table>"

    # LOGINS
    html_content += "<h1>👤 Login Activity</h1><table><tr><th>Type</th><th>User</th><th>Source IP</th><th>Details</th><th>Time</th></tr>"
    for l in logins:
        color = "#22c55e" if l["type"] == "SUCCESS" else "#ef4444"
        html_content += f"<tr><td style='color:{color}'>{l['type']}</td><td>{l['user']}</td><td>{l['ip']}</td><td>{l['detail']}</td><td>{l['time']}</td></tr>"
    html_content += "</table>"

    # CONNECTIONS
    html_content += "<h1>🌐 Active Network Connections</h1><table><tr><th>Source</th><th>Destination</th><th>Protocol</th><th>State</th><th>Process</th></tr>"
    for c in connections:
        html_content += f"<tr><td>{c['src']}</td><td>{c['dst']}</td><td>{c['protocol']}</td><td>{c['state']}</td><td>{c['process']}</td></tr>"
    html_content += "</table>"

    # HISTORY
    html_content += "<h1>🌐 Recent Websites</h1><table><tr><th>Time</th><th>Title</th><th>URL</th></tr>"
    for h in history[:30]:
        html_content += f"<tr><td>{h['time']}</td><td>{html.escape(h['title'])}</td><td>{html.escape(h['url'])}</td></tr>"
    html_content += "</table>"

    # TOP DOMAINS
    html_content += "<h1>📊 Top Domains</h1><table><tr><th>Domain</th><th>Count</th></tr>"
    for d, c in top_domains:
        html_content += f"<tr><td>{d}</td><td>{c}</td></tr>"
    html_content += "</table>"

    # SUSPICIOUS
    html_content += "<h1>⚠️ Suspicious URLs</h1><table><tr><th>Time</th><th>URL</th></tr>"
    for s in suspicious[:20]:
        html_content += f"<tr><td>{s['time']}</td><td style='color:#ef4444'>{html.escape(s['url'])}</td></tr>"
    html_content += "</table>"

    html_content += "</body></html>"

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write(html_content)

    print(f"[✔] Report generated: {OUTPUT_FILE}")

# =========================
# MAIN
# =========================
def main():
    print("[+] Fetching logs...")
    events = get_events()

    print("[+] Analyzing logs...")
    alerts, logins = analyze(events)

    print("[+] Fetching network connections...")
    connections = get_connections()

    print("[+] Fetching browser history...")
    history = get_browser_history()

    print("[+] Analyzing browser data...")
    top_domains, suspicious = analyze_history(history)

    generate_html(alerts, logins, connections, history, top_domains, suspicious)

if __name__ == "__main__":
    main()
