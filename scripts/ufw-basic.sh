set -e

sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https

sudo ufw limit ssh

sudo cp ../configs/ufw/before.rules /etc/ufw/
sudo cp ../configs/ufw/after.rules /etc/ufw/

sudo ufw enable
echo "[*] UFW configurado!"