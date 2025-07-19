import os

print("[*] Verificando atualizações de segurança...")
os.system("sudo apt update -q && sudo apt list --upgradable")

print("[*] Verificando portas abertas...")
os.system("sudo ss -tuln")