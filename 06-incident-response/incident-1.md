# Incident Response Entry #1

## 📋 Incident Details

| Field | Detail |
|-------|--------|
| **Date/Time** | 2026-06-14, 23:52 |
| **Incident** | Repeated failed login attempts on account 'amoako' followed by successful login from unrecognized IP |
| **Detection Source** | Login attempt log review |
| **Status** | Resolved |

## 🎯 Actions Taken

1. Verified IP (185.220.101.4) against threat intelligence lists
2. Confirmed IP was flagged as Tor exit node
3. Temporarily disabled the account
4. Notified account owner

## ✅ Resolution

- Account owner confirmed they did not initiate the login
- Password was reset
- MFA was enrolled before re-enabling the account

## 📝 Lessons Learned

- **Priority Gap**: Accounts without MFA are vulnerable
- **Recommendation**: Enforce MFA organization-wide within 30 days
- **Improvement**: Add automated alerting for suspicious login patterns

## 🛠️ Indicators of Compromise (IOCs)

| Type | Value |
|------|-------|
| IP Address | 185.220.101.4 |
| Username | amoako |
| Time | 23:47 - 23:49 UTC |
| Behavior | 2 failures → 1 success |
