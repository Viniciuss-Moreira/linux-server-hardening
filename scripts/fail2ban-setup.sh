set -e

sudo apt update && sudo apt install -y fail2ban sendmail

sudo cp ../configs/fail2ban/jail.local /etc/fail2ban/jail.local

sudo systemctl enable fail2ban
sudo systemctl restart fail2ban

echo "[*] Fail2Ban configurado com sucesso!"
