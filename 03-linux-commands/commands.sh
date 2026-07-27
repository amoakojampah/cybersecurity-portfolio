#!/bin/bash
# Linux File Permissions Management
# Scenario: HR department folder with sensitive documents

# Create groups
sudo groupadd hr
sudo groupadd staff

# Create users
sudo useradd -G hr amoako
sudo useradd -G staff kwame

# Create directory
sudo mkdir /shared/hr-records

# Set ownership and permissions for directory
sudo chown -R root:hr /shared/hr-records
sudo chmod -R 770 /shared/hr-records

# Set ownership and permissions for specific file
sudo chown root:staff /shared/hr-records/policy.pdf
sudo chmod 640 /shared/hr-records/policy.pdf

# Verify permissions
ls -l /shared/hr-records

# Expected output:
# drwxrwx--- 2 root hr     4096 Jul 20 09:14 .
# -rw-r----- 1 root staff 88213 Jul 20 09:15 policy.pdf
