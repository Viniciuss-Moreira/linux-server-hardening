set -e

sudo apt purge -y telnet rsh-server rsh-client nis tftp tftp-server xinetd

sudo cp ../configs/system/sysctl.conf /etc/sysctl.conf
sudo sysctl -p

sudo cp ../configs/system/limits.conf /etc/security/limits.conf

sudo cp ../configs/system/login.defs /etc/login.defs

sudo apt install -y chrony
sudo systemctl enable chronyd
sudo systemctl start chronyd

echo "[*] Hardening concluído"