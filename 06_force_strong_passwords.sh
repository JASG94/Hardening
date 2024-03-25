#!/bin/bash

# Variables definition
MIN_PASS_LEN="14"
MIN_PASS_CLASS="4"

# Install libpam-pwquality
apt update && apt install -y libpam-pwquality

# Set the min password lenght
sed -i "s/^# minlen = 8/minlen = $MIN_PASS_LEN/" /etc/security/pwquality.conf

# Set the min password class
sed -i "s/^# minclass = 0/minclass = $MIN_PASS_CLASS/" /etc/security/pwquality.conf