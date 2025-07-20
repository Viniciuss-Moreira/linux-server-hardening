# Linux Server Hardening

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Linux](https://img.shields.io/badge/platform-linux-lightgrey.svg)
![Security](https://img.shields.io/badge/security-hardening-red.svg)
![Ubuntu](https://img.shields.io/badge/ubuntu-18.04+-orange.svg)
![CentOS](https://img.shields.io/badge/centos-7+-blue.svg)

## 🛡️ Descrição

Conjunto completo de scripts e guias para hardening (endurecimento) de servidores Linux. Este repositório implementa as melhores práticas de segurança baseadas nos padrões CIS (Center for Internet Security) e NIST para proteger servidores em produção.

## 🎯 Objetivos de Segurança

- **Redução da superfície de ataque**
- **Implementação de controles de acesso**
- **Monitoramento e auditoria**
- **Proteção contra ataques automatizados**
- **Compliance com padrões de segurança**
- **Configuração de logging centralizado**

## 📁 Estrutura do Projeto

```
linux-server-hardening/
├── scripts/
│   ├── fail2ban-setup.sh
│   ├── ufw-basic.sh
│   ├── ssh-secure.sh
│   ├── system-hardening.sh
│   ├── audit-setup.sh
│   └── compliance-check.sh
├── configs/
│   ├── fail2ban/
│   │   ├── jail.local
│   │   └── custom-filters/
│   ├── ssh/
│   │   ├── sshd_config.secure
│   │   └── ssh_banner.txt
│   ├── ufw/
│   │   ├── before.rules
│   │   └── after.rules
│   └── system/
│       ├── sysctl.conf
│       ├── limits.conf
│       └── login.defs
├── templates/
│   ├── ubuntu-20.04/
│   ├── centos-8/
│   └── debian-11/
├── audits/
│   ├── cis-benchmark.sh
│   ├── security-scan.py
│   └── vulnerability-check.sh
├── docs/
│   ├── hardening-checklist.md
│   ├── incident-response.md
│   └── maintenance.md
└── README.md
```

## 🔒 Scripts de Hardening

### 🚫 fail2ban-setup.sh
**Proteção contra ataques de força bruta**
- Configuração automática do Fail2Ban
- Proteção SSH, HTTP, FTP, email
- Integração com iptables/ufw
- Notificações por email
- Listas brancas personalizadas
- Monitoramento de logs customizados

### 🔥 ufw-basic.sh
**Configuração de firewall simplificada**
- Firewall básico com UFW
- Regras pré-definidas por serviço
- Proteção contra port scanning
- Rate limiting automático
- Logging de conexões suspeitas
- Backup e restauração de regras

### 🔐 ssh-secure.sh
**Endurecimento do serviço SSH**
- Desabilitar login root
- Autenticação por chave pública
- Configuração de algoritmos seguros
- Rate limiting de conexões
- Banner de aviso legal
- Auditoria de tentativas de login

### ⚙️ system-hardening.sh
**Hardening do sistema operacional**
- Remoção de serviços desnecessários
- Configuração de parâmetros kernel
- Políticas de senha fortes
- Configuração de umask
- Desabilitar protocolos inseguros
- Configuração de timezone e NTP

## ⚡ Instalação e Configuração

### Verificar Compatibilidade
```bash
# Verificar distribuição
lsb_release -a

# Verificar versão do kernel
uname -r

# Verificar serviços ativos
systemctl list-units --type=service --state=active
```

### Instalação Rápida
```bash
# Clone o repositório
git clone https://github.com/seu-usuario/linux-server-hardening.git
cd linux-server-hardening

# Tornar scripts executáveis
chmod +x scripts/*.sh

# Executar verificação de pré-requisitos
sudo ./scripts/pre-check.sh

# Aplicar hardening básico (ATENÇÃO: pode interromper conexões)
sudo ./scripts/basic-hardening.sh
```

### Instalação Modular
```bash
# Aplicar apenas configurações SSH
sudo ./scripts/ssh-secure.sh

# Configurar apenas Fail2Ban
sudo ./scripts/fail2ban-setup.sh

# Aplicar apenas regras de firewall
sudo ./scripts/ufw-basic.sh
```

## 🔧 Configuração Detalhada

### SSH Hardening
```bash
# Configuração avançada do SSH
sudo ./scripts/ssh-secure.sh --advanced

# Parâmetros personalizados
sudo ./scripts/ssh-secure.sh \
    --port 2222 \
    --max-auth-tries 3 \
    --login-grace-time 30 \
    --disable-root-login
```

**Configuração SSH Segura**:
```bash
# /etc/ssh/sshd_config (principais alterações)
Port 2222
Protocol 2
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
MaxAuthTries 3
LoginGraceTime 30
ClientAliveInterval 300
ClientAliveCountMax 2
Banner /etc/ssh/banner.txt
```

### Fail2Ban Configuration
```bash
# Configuração básica
sudo ./scripts/fail2ban-setup.sh --basic

# Configuração avançada com múltiplos serviços
sudo ./scripts/fail2ban-setup.sh \
    --services ssh,apache,nginx,postfix \
    --bantime 3600 \
    --maxretry 5
```

**Jail Configuration**:
```ini
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 5
backend = systemd
banaction = ufw
destemail = admin@domain.com
sendername = Fail2Ban

[ssh]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 86400
```

### UFW Firewall Setup
```bash
# Configuração básica
sudo ./scripts/ufw-basic.sh --server-profile

# Configuração customizada
sudo ./scripts/ufw-basic.sh \
    --ssh-port 2222 \
    --allow-from "192.168.1.0/24" \
    --web-server \
    --mail-server
```

### System Hardening
```bash
# Hardening completo do sistema
sudo ./scripts/system-hardening.sh --full

# Hardening seletivo
sudo ./scripts/system-hardening.sh \
    --kernel-hardening \
    --network-hardening \
    --filesystem-hardening
```

## 📋 Checklist de Hardening

### ✅ Configurações Essenciais

#### Sistema Operacional
- [ ] Atualizar sistema e patches de segurança
- [ ] Remover serviços e pacotes desnecessários
- [ ] Configurar políticas de senha forte
- [ ] Implementar sudo com privilégios mínimos
- [ ] Configurar umask adequado (022)
- [ ] Desabilitar contas de sistema desnecessárias

#### Rede e Firewall
- [ ] Configurar firewall básico (UFW/iptables)
- [ ] Desabilitar protocolos inseguros
- [ ] Configurar rate limiting
- [ ] Implementar fail2ban
- [ ] Configurar logging de rede
- [ ] Desabilitar IPv6 se não utilizado

#### SSH e Acesso Remoto
- [ ] Alterar porta padrão do SSH
- [ ] Desabilitar login root
- [ ] Configurar autenticação por chave
- [ ] Implementar rate limiting SSH
- [ ] Configurar banner de aviso
- [ ] Limitar usuários autorizados

#### Auditoria e Monitoramento
- [ ] Configurar auditd para logs de sistema
- [ ] Implementar logrotate
- [ ] Configurar rsyslog centralizado
- [ ] Monitoar tentativas de login
- [ ] Configurar alertas de segurança
- [ ] Implementar AIDE para integridade de arquivos

## 🔍 Auditoria e Compliance

### CIS Benchmark Compliance
```bash
# Executar auditoria CIS
sudo ./audits/cis-benchmark.sh --level 1

# Relatório detalhado
sudo ./audits/cis-benchmark.sh --report --output /tmp/cis-report.html

# Corrigir automaticamente problemas menores
sudo ./audits/cis-benchmark.sh --auto-fix --safe-only
```

### Security Scan
```bash
# Scan completo de vulnerabilidades
python3 ./audits/security-scan.py --full-scan

# Scan rápido de configurações
python3 ./audits/security-scan.py --quick-check

# Scan com relatório JSON
python3 ./audits/security-scan.py --format json --output security-report.json
```

### Compliance Check
```bash
# Verificar compliance NIST
sudo ./scripts/compliance-check.sh --standard nist

# Verificar compliance PCI-DSS
sudo ./scripts/compliance-check.sh --standard pci-dss

# Relatório de compliance customizado
sudo ./scripts/compliance-check.sh --custom-rules rules/custom.json
```

## 📊 Monitoramento Contínuo

### Automated Security Monitoring
```bash
# Configurar monitoramento automático
./scripts/setup-monitoring.sh

# Verificações diárias via cron
echo "0 2 * * * /path/to/daily-security-check.sh" | crontab -
```

### Log Analysis
```bash
# Análise de logs de segurança
./scripts/log-analyzer.sh --period 7days

# Detecção de anomalias
python3 ./audits/anomaly-detector.py --realtime

# Relatório de segurança semanal
./scripts/security-report.sh --weekly --email admin@domain.com
```

### Performance Impact
```bash
# Medir impacto na performance
./audits/performance-check.sh --before-after

# Benchmark de segurança vs performance
python3 ./audits/security-benchmark.py
```

## 🚨 Incident Response

### Security Breach Detection
```bash
# Verificar comprometimento do sistema
sudo ./audits/compromise-check.sh

# Análise forense básica
sudo ./scripts/forensics-collect.sh --preserve-evidence

# Isolamento de emergência
sudo ./scripts/emergency-lockdown.sh
```

### Recovery Procedures
```bash
# Restaurar configurações de backup
sudo ./scripts/restore-config.sh --from-backup

# Resetar credenciais comprometidas
sudo ./scripts/credential-reset.sh --all-users

# Reconstruir integridade do sistema
sudo ./scripts/system-rebuild.sh --secure-mode
```

## 🔧 Personalização por Ambiente

### Servidor Web
```bash
# Hardening específico para web server
sudo ./scripts/web-server-hardening.sh \
    --apache \
    --ssl-only \
    --hide-version
```

### Servidor de Banco de Dados
```bash
# Hardening para database server
sudo ./scripts/database-hardening.sh \
    --mysql \
    --restrict-network \
    --encrypt-storage
```

### Servidor de Email
```bash
# Hardening para mail server
sudo ./scripts/mail-server-hardening.sh \
    --postfix \
    --dovecot \
    --spam-protection
```

## 🔄 Manutenção e Atualizações

### Updates Automáticos
```bash
# Configurar updates automáticos de segurança
sudo ./scripts/auto-updates.sh --security-only

# Agendar reinicialização para patches kernel
sudo ./scripts/schedule-reboot.sh --security-patches
```

### Backup de Configurações
```bash
# Backup completo das configurações
sudo ./scripts/config-backup.sh --full

# Restaurar configurações específicas
sudo ./scripts/config-restore.sh --ssh --firewall
```

### Validação Periódica
```bash
# Validação mensal de segurança
./scripts/monthly-validation.sh

# Auditoria trimestral completa
./scripts/quarterly-audit.sh --comprehensive
```

## 🧪 Ambiente de Teste

### Validação de Configurações
```bash
# Testar configurações em ambiente isolado
vagrant up test-environment
./scripts/test-hardening.sh --environment vagrant

# Verificar impacto em aplicações
./scripts/application-compatibility.sh --test-suite
```

### Rollback Plan
```bash
# Criar ponto de restauração
sudo ./scripts/create-checkpoint.sh

# Rollback em caso de problemas
sudo ./scripts/rollback.sh --to-checkpoint last
```

## 📚 Recursos Educacionais

### Documentação Técnica
- [Hardening Checklist](docs/hardening-checklist.md)
- [Incident Response Guide](docs/incident-response.md)
- [Maintenance Procedures](docs/maintenance.md)
- [Troubleshooting Guide](docs/troubleshooting.md)

### Referencias e Standards
- **CIS Controls**: Center for Internet Security
- **NIST Cybersecurity Framework**
- **OWASP Server Security Guidelines**
- **Linux Security Best Practices**

## ⚠️ Avisos Importantes

### Antes da Implementação
1. **SEMPRE fazer backup completo**
2. **Testar em ambiente não-produtivo**
3. **Manter acesso alternativo ao servidor**
4. **Documentar mudanças realizadas**
5. **Planejar janela de manutenção**

### Pós-Implementação
1. **Validar funcionamento de serviços críticos**
2. **Monitorar logs por 24-48h**
3. **Verificar conectividade e performance**
4. **Documentar configurações aplicadas**
5. **Treinar equipe nas novas configurações**

## 🤝 Contribuindo

### Guidelines
- Testar scripts em múltiplas distribuições
- Documentar impacto nas aplicações
- Seguir padrões de segurança reconhecidos
- Incluir testes de regressão
- Manter compatibilidade com versões LTS

### Process
1. Fork o repositório
2. Criar branch para feature/fix
3. Testar em ambiente isolado
4. Documentar mudanças
5. Submeter Pull Request

## 📄 Licença

Este projeto está licenciado sob Apache 2.0 License. Ver [LICENSE](LICENSE) para detalhes.

## 👨‍💻 Autor

**Vinicius Moreira**
- GitHub: [@Viniciuss-Moreira](https://github.com/Viniciuss-Moreira)
- LinkedIn: [Vinicius Moreira](https://linkedin.com/in/viniciusmoreira-)
- Email: vinnismoreira@gmail.com

## 🔗 Links Úteis

- [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks/)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)
- [Linux Security Documentation](https://www.kernel.org/doc/html/latest/admin-guide/security.html)
- [Ubuntu Security Guide](https://ubuntu.com/security)

---

🔐 **Segurança é um processo, não um produto!** 

⭐ Se este projeto foi útil para proteger sua infraestrutura, considere dar uma estrela!
