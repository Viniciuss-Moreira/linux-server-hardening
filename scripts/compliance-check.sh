bash ../audits/cis-benchmark.sh

python3 ../audits/security-scan.py

echo "[*] Rodando verificação de vulnerabilidades"
bash ../audits/vulnerability-check.sh