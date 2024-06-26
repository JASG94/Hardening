#!/bin/bash
echo "[ STARTING ]"

echo "[TASK 1: SSH Hardening]"
sudo ./01_ssh_hardening.sh

echo "[TASK 2: Disable root login]"
sudo ./02_disable_root_login.sh

echo "[TASK 3: Remove_root_pass]"
sudo ./03_remove_root_pass.sh

echo "[TASK 4: Disable ctrl+alt+del]"
sudo ./04_disable_ctrl_alt_del.sh

echo "[TASK 5: System packages upgrade and clean]"
sudo ./05_system_upgrade.sh

echo "[TASK 6: Force strong passwords]"
sudo ./06_force_strong_passwords.sh

echo "[TASK 7: Set file permissions]"
sudo ./07_set_file_permissions.sh

echo "[TASK 8: Tunning sudoers file]"
sudo ./08_config_sudoers.sh

echo "[ DONE ]"