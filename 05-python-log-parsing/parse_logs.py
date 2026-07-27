
#!/usr/bin/env python3
"""
Log Parser for Authentication Logs
Detects failed SSH login attempts and brute-force patterns
"""

def parse_auth_log(filename):
    """Parse auth.log file and identify failed login attempts"""
    
    failed_attempts = []
    successful_attempts = []
    
    with open(filename, 'r') as f:
        lines = f.readlines()
    
    for line in lines:
        if 'Failed password' in line:
            parts = line.split()
            user = parts[8]
            ip = parts[10]
            timestamp = ' '.join(parts[0:3])
            failed_attempts.append((timestamp, user, ip))
            
        elif 'Accepted password' in line:
            parts = line.split()
            user = parts[8]
            ip = parts[10]
            timestamp = ' '.join(parts[0:3])
            successful_attempts.append((timestamp, user, ip))
    
    return failed_attempts, successful_attempts

def analyze_patterns(failed, successful):
    """Analyze login patterns for suspicious activity"""
    
    print(f"Total failed attempts: {len(failed)}")
    print(f"Total successful attempts: {len(successful)}")
    print("\nFailed Attempts Details:")
    print("-" * 50)
    
    for entry in failed:
        print(f"{entry[0]} | user={entry[1]} | ip={entry[2]}")
    
    # Check for brute-force pattern (multiple failures then success)
    if len(failed) >= 2:
        print("\n⚠️ WARNING: Multiple failed attempts detected!")
        print("Review for potential brute-force attack.")

if __name__ == "__main__":
    failed, successful = parse_auth_log('auth.log')
    analyze_patterns(failed, successful)

# Expected Output:
# Total failed attempts: 2
# Total successful attempts: 2
# Failed Attempts Details:
# --------------------------------------------------
# Jun 14 23:47:02 | user=amoako | ip=185.220.101.4
# Jun 14 23:48:11 | user=amoako | ip=185.220.101.4
# ⚠️ WARNING: Multiple failed attempts detected!
# Review for potential brute-force attack.
