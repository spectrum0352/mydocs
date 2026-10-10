IoT Replay Attacks

Attackers replay intercepted valid communications to gain unauthorized
access.
Azure Context:  
Azure IoT devices communicating with backends are at risk.
Mitigation:
Use TLS with mutual authentication on IoT communications.
Implement nonce or timestamp-based tokens to invalidate replayed
messages.
Employ Azure IoT security features that support secure messaging.