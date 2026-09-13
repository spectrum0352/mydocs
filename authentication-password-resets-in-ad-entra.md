Password reset attacks in AD, ENTRA

# Password Reset Vulnerabilities

Sure! Here's a **clean, summarized, and corrected version** of your
notes on **Password Cracking and Reset Vulnerabilities** for AD, Local
accounts, and Microsoft Entra ID, focusing on common password reset
issues and attack scenarios:

------------------------------------------------------------------------

**Password Reset Vulnerabilities in AD, Local Accounts, Microsoft Entra
ID**

**Overview**

Password reset mechanisms are critical but often vulnerable points in
authentication flows. Attackers exploit improper handling of reset
tokens/links, missing expiration, parameter manipulation, and other
flaws to reset victim passwords or hijack accounts.

------------------------------------------------------------------------

**Common Vulnerabilities and Attack Scenarios**

**1. Password Reset Link Does Not Expire**

- **Issue:** Reset link/token remains valid after password is changed or
  indefinitely.

- **Risk:** Allows reuse of reset links multiple times to reset the
  password.

- **Example Scenarios:**

  - User requests reset, uses link once, but the same link still works
    later.

  - Request multiple reset links; older tokens do not expire after new
    ones are generated.

- **Impact:** Account takeover if attacker gains access to an old reset
  link.

- **Reference:** [HackerOne Report
  \#898841](https://hackerone.com/reports/898841)

------------------------------------------------------------------------

**2. Reset Token Usable After Password Change (Race Conditions)**

- **Scenario:**

  1.  Request password reset link but don't use it immediately.

  2.  Log in normally, change password.

  3.  Later use old reset token to reset password again.

- **Impact:** Tokens are not invalidated properly, enabling attacker
  access if email is compromised.

- **Reference:** [HackerOne Report
  \#948345](https://hackerone.com/reports/948345)

------------------------------------------------------------------------

**3. Reset Link/Token Remains Valid After Email Change**

- **Scenario:**

  1.  Receive reset link.

  2.  Change account email before using the reset link.

  3.  Reset link still works to change password.

- **Impact:** Attackers can abuse reset links even after account details
  change.

- **Reference:** [HackerOne Report
  \#685007](https://hackerone.com/reports/685007)

------------------------------------------------------------------------

**4. Parameter Manipulation Attacks**

- **Email Parameter Manipulation:** Attackers modify email parameters in
  reset requests to:

  - Receive victim’s reset links on attacker-controlled email.

  - Perform HTTP Parameter Pollution (HPP) or use multiple emails
    separated by commas, newlines, or special characters.

- **Host Header Poisoning:** Altering HTTP Host or X-Forwarded-Host
  headers to poison the reset link URL, redirecting reset links to
  attacker domains.

- **Impact:** Unauthorized password resets or leaking of reset tokens.

- **Reference:**

  - [HackerOne Report \#1175081](https://hackerone.com/reports/1175081)

  - [Host Header Poisoning Medium
    Article](https://shahjerry33.medium.com/otp-bypass-developers-check-5786885d55c6)

------------------------------------------------------------------------

**5. Password Reset Token Leakage**

- Via **Referer Header**: Reset tokens appear in HTTP referer headers
  when users click social media links from reset pages.

- Via **API Responses**: Reset links are returned in API responses in
  plaintext and can be intercepted.

- **Impact:** Token leakage allows CSRF and account takeover attacks.

- **Reference:** [HackerOne Report
  \#751581](https://hackerone.com/reports/751581)

------------------------------------------------------------------------

**6. No Rate Limiting on Reset Requests**

- **Issue:** Unlimited password reset requests allowed without
  throttling.

- **Impact:** Allows brute force or denial of service attacks on reset
  endpoints.

- **Test:** Use Burp Suite Intruder to flood reset endpoint; if not
  blocked, vulnerability exists.

- **Reference:** [HackerOne Report
  \#838572](https://hackerone.com/reports/838572)

------------------------------------------------------------------------

**7. User Enumeration via Password Reset Page**

- **How:** Different responses or behaviors when entering valid vs
  invalid usernames/emails on reset pages.

- **Impact:** Attackers discover valid accounts for targeted attacks.

- **Reference:** [HackerOne Report
  \#77067](https://hackerone.com/reports/77067)

------------------------------------------------------------------------

**8. HTML Injection on Reset/Registration Pages**

- **How:** Injection of arbitrary HTML/JS in form inputs during account
  creation or reset process.

- **Impact:** Content spoofing, phishing, or defacement of user-facing
  pages.

- **Reference:** [HackerOne Report
  \#111094](https://hackerone.com/reports/111094)

**Summary Table**

| **Vulnerability** | **Description** | **Impact** | **Reference** |
|----|----|----|----|
| Reset Link Not Expiring | Token/link usable after password changed | Account takeover | \#898841, \#283550 |
| Old Token Still Usable | Reset tokens remain valid after password change | Account takeover | \#948345 |
| Reset Link Valid After Email Change | Reset links remain valid despite email change | Account takeover | \#685007 |
| Parameter Manipulation | Email/Host header manipulation to hijack reset | Token theft, password reset | \#1175081, \#226659 |
| Token Leakage via Referer/API | Tokens exposed in HTTP headers or responses | CSRF, account takeover | \#751581 |
| No Rate Limiting | Unlimited reset requests | Brute force, DoS | \#838572 |
| User Enumeration | Different responses for valid/invalid users | Targeted attacks | \#77067 |
| HTML Injection | Arbitrary HTML/JS in reset or register forms | Phishing, defacement | \#111094 |

------------------------------------------------------------------------

**Best Practices to Mitigate These Vulnerabilities**

- Ensure password reset tokens **expire immediately** after use or after
  a short timeout.

- Invalidate all outstanding tokens on password or email changes.

- Implement **rate limiting** on reset requests.

- Avoid leaking tokens in URLs, HTTP referer headers, or API responses.

- Sanitize and validate all user inputs to prevent HTML/JS injection.

- Prevent user enumeration by normalizing reset page responses.

- Protect reset endpoints against host header manipulation.

- Use multi-factor authentication (MFA) in addition to password reset.

------------------------------------------------------------------------

If you want, I can help you create a **more focused summary for Active
Directory local accounts** or **Microsoft Entra ID** specifically, or
provide remediation steps for each scenario. Just let me know!
