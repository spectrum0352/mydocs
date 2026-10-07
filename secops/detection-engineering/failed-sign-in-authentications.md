**Failed Sign-in Authentications:**

```
DeviceLogonEvents
| where DeviceName in ("device1", "device2") and ActionType == "LogonFailure"
| summarize LogonFailureCount = count() by DeviceName
```
