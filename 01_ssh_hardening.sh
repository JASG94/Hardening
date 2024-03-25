#!/bin/bash

# Configuration variables
ALLOWED_SSH_SESSIONS="2"
ALLOWED_SSH_MAXTRIES="2"
ALLOWED_SSH_CLIENTALIVE="1"
ALLOWED_SSH_USER=$(logname)

# Copy current
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.back

# Allow only ALLOWED_SSH_USER
echo "AllowUsers $ALLOWED_SSH_USER" >> /etc/ssh/sshd_config

# Allow only ALLOWED_SSH_MAXTRIES
sed -i "s/^#*MaxAuthTries [0-9]\+/MaxAuthTries $ALLOWED_SSH_MAXTRIES/" /etc/ssh/sshd_config

# Disable X11 Forwarding
sed -i "s/^#*X11Forwarding yes/X11Forwarding no/" /etc/ssh/sshd_config

# Disable HostbasedAuthentication
echo "HostbasedAuthentication no" >> /etc/ssh/sshd_config

# Disable root login
echo "PermitRootLogin no" >> /etc/ssh/sshd_config

# Don't allow empty passwords
echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config

# Set trusted ciphers
echo "Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr" >> /etc/ssh/sshd_config

# Ensure to use strong MAC algorithms
echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256" >> /etc/ssh/sshd_config

# Allow only strong Key exchange algorithms
echo "KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256" >> /etc/ssh/sshd_config

# Disable TCP forwarding
echo "AllowTcpForwarding no" >> /etc/ssh/sshd_config

# Set number of Max sessions allowed
echo "MaxSessions $ALLOWED_SSH_SESSIONS" >> /etc/ssh/sshd_config

# Disable spoofable connections
sed -i "s/^#*TCPKeepAlive [yes|no]\+/TCPKeepAlive no/" /etc/ssh/sshd_config

# Max client alive messages allowed
sed -i "s/^#*ClientAliveCountMax [0-9]\+/ClientAliveCountMax $ALLOWED_SSH_CLIENTALIVE/" /etc/ssh/sshd_config

# Restart ssh service
service ssh restart

