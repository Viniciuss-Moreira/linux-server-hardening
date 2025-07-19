echo "[*] Verificando CIS Benchmark..."
grep -q "PermitRootLogin no" /etc/ssh/sshd_config && echo "[OK] SSH root login desabilitado" || echo "[ALERTA] SSH root login habilitado"
grep -q "PasswordAuthentication no" /etc/ssh/sshd_config && echo "[OK] Autenticação por senha desabilitada" || echo "[ALERTA] Autenticação por senha habilitada"