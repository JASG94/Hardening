#!/bin/bash

# Add use_pty and logfile to sudoers file if not present
if grep -q use_pty /etc/sudoers; then
    if grep -q logfile /etc/sudoers; then
        echo "Sudoers file is OK"
    else
        echo "Defaults	logfile="/var/log/sudo.log"" >> /etc/sudoers
    fi
else
    echo "Defaults        use_pty" >> /etc/sudoers
    if ! grep -q logfile /etc/sudoers; then
        echo "Defaults	logfile="/var/log/sudo.log"" >> /etc/sudoers
    fi
fi