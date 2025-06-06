#!/bin/bash
# Example compliance fix script for RHEL

# Ensure password complexity
authselect select sssd with-faillock --force

# Set SELinux enforcing
setenforce 1
sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config

# Enable auditing
systemctl enable auditd
systemctl start auditd

# Fix insecure file permissions
chmod 700 /root
chmod 600 /etc/ssh/sshd_config

# Restart affected services
systemctl restart sshd
