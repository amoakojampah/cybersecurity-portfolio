-- Create login_attempts table
CREATE TABLE login_attempts (
    id INTEGER PRIMARY KEY,
    username TEXT,
    login_time DATETIME,
    status TEXT,
    ip_address TEXT
);

-- Insert sample data
INSERT INTO login_attempts VALUES
(1, 'jkoffie', '2026-06-14 09:12:00', 'success', '10.0.1.14'),
(2, 'amoako', '2026-06-14 23:47:00', 'failed', '185.220.101.4'),
(3, 'amoako', '2026-06-14 23:48:00', 'failed', '185.220.101.4'),
(4, 'amoako', '2026-06-14 23:49:00', 'success', '185.220.101.4'),
(5, 'kwame', '2026-06-15 08:03:00', 'success', '10.0.1.22');

-- Query 1: Failed logins outside business hours
-- Business hours: 6:00 AM - 8:00 PM

SELECT 
    username, 
    login_time, 
    ip_address
FROM login_attempts
WHERE status = 'failed'
    AND (EXTRACT(HOUR FROM login_time) >= 20
    OR EXTRACT(HOUR FROM login_time) < 6);

-- Results:
-- username: amoako, login_time: 2026-06-14 23:47:00, ip: 185.220.101.4
-- username: amoako, login_time: 2026-06-14 23:48:00, ip: 185.220.101.4

-- Query 2: Logins from flagged IP range
-- IP range belongs to known Tor exit nodes

SELECT 
    username, 
    login_time, 
    status
FROM login_attempts
WHERE ip_address LIKE '185.220.%'
ORDER BY login_time;

-- Results:
-- amoako | 2026-06-14 23:47:00 | failed
-- amoako | 2026-06-14 23:48:00 | failed
-- amoako | 2026-06-14 23:49:00 | success
