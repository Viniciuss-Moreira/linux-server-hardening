set -e

sudo apt update && sudo apt install -y auditd

sudo auditctl -w /etc/passwd -p wa -k passwd_changes
sudo auditctl -w /etc/shadow -p wa -k shadow_changes
sudo auditctl -w /etc/group -p wa -k group_changes

echo "[*] Auditoria configurada!"