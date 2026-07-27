# Security Audit: Small Office Network

## 📋 Scope

**Organization**: Squareline Technologies Limited (sample department)  
**Endpoints**: 12 devices  
**Environment**: Small office with shared Wi-Fi access point, one on-site file server, and a mix of company-owned and personal devices

## 🔍 Audit Checklist Used

- Asset inventory (devices, OS versions, ownership)
- Account and access review (admin accounts, shared logins, offboarded users)
- Patch and update status
- Password policy and MFA coverage
- Network segmentation and firewall rules
- Physical security of network equipment
- Backup and recovery process

## 📊 Findings

| Area | Finding | Risk |
|------|---------|------|
| Accounts | Two former contractors still had active VPN credentials | 🔴 High |
| Patching | 4 of 12 workstations were 2+ months behind on OS security updates | 🔴 High |
| MFA | Admin/shared accounts had no multi-factor authentication enabled | 🔴 High |
| Network | Guest Wi-Fi and staff Wi-Fi shared the same VLAN | 🟡 Medium |
| Passwords | Default router admin password had not been changed | 🟡 Medium |
| Backups | File server backups ran nightly but were never test-restored | 🟡 Medium |
| Physical | Network switch was in an unlocked closet accessible to all staff | 🟢 Low |

## ✅ Recommendations

### 🔴 High Priority
- Immediately revoke VPN access for departed contractors and audit all accounts monthly against an HR offboarding checklist
- Enable automatic patching or a monthly patch cycle with compliance tracking
- Enforce MFA on all admin and remote-access accounts

### 🟡 Medium Priority
- Segment guest Wi-Fi onto its own VLAN, isolated from internal file/print resources
- Change default device credentials and enforce a password policy (12+ characters, no reuse)
- Schedule quarterly backup restore tests to confirm recoverability

### 🟢 Low Priority
- Relocate or lock network equipment; restrict physical access to IT staff
