set -e

sudo cp ../configs/ssh/sshd_config.secure /etc/ssh/sshd_config
sudo cp ../configs/ssh/ssh_banner.txt /etc/ssh/banner

sudo systemctl restart ssh
echo "[*] SSH seguro"
