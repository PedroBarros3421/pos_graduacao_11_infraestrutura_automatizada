# 🚀 Trabalho Final - Infraestrutura Automatizada

## 📋 Descrição do Projeto

Este projeto demonstra a automação completa de infraestrutura utilizando **Terraform** para provisionamento e **Ansible** para configuração de serviços. O objetivo é criar uma instância EC2 Ubuntu na AWS e configurar um servidor Apache com uma página web personalizada.

## 🏗️ Arquitetura

- **Cloud Provider**: AWS
- **Compute**: EC2 Ubuntu Server 24.04 `i-02a3212d9d21ca06f`
- **Web Server**: Apache2
- **IaC**: Terraform + Ansible
- **Automação**: apt update + configuração completa via Ansible

## 📁 Estrutura do Projeto

```plaintext
TrabFinal/
├── terraform/           # Infraestrutura como código
│   ├── main.tf
│   ├── variables.tf
│   ├── backend.tf
│   ├── terraform.tfvars
│   └── EC2Tutorial.pem
├── ansible/            # Configuração e automação
│   ├── playbook.yml
│   └── inventory.yml
├── site/              # Página web
│   └── index.html
└── ReadMe.md
```

---

## 🚀 Como Executar

### **Pré-requisitos**

```bash
# Terraform instalado
terraform --version

# Ansible instalado
ansible --version

# AWS CLI configurado com credenciais
aws configure
```

### **Passo 1: Provisionar Infraestrutura com Terraform**

```bash
# Navegar para pasta terraform
cd terraform

# Inicializar Terraform
terraform init

# Planejar recursos
terraform plan

# Aplicar configuração (criar EC2)
terraform apply
# Digite 'yes' quando solicitado

# Verificar IP da instância criada
terraform output ec2_public_ip
```

### **Passo 2: Configurar Servidor com Ansible**

```bash
# Navegar para pasta ansible
cd ../ansible

# Executar playbook (instalar Apache + configurações)
ansible-playbook -i inventory.yml playbook.yml

# Aguarde a execução completar (~2-3 minutos)
```

### **Passo 3: Acessar Aplicação**

```bash
# Obter IP público da instância
cd ../terraform
terraform output ec2_public_ip

# Acessar no navegador:
# http://SEU_IP_AQUI
```

---

## ⚙️ O que o Ansible Executa

O playbook `ansible/playbook.yml` realiza as seguintes tarefas:

1. ✅ **apt update** - Atualiza cache de pacotes (executado como root)
2. ✅ **Instalação Apache2** - Instala servidor web
3. ✅ **Configuração do Apache** - Inicia e habilita o serviço
4. ✅ **Deploy da página** - Copia `site/index.html` para `/var/www/html/`
5. ✅ **Configuração de Firewall** - Libera portas 80 (HTTP) e 443 (HTTPS)
6. ✅ **Validação** - Verifica status do Apache
7. ✅ **Arquivo de validação** - Cria arquivo de log da execução

## 🌐 Resultado Final

Após a execução completa, você terá:

- ✅ **EC2 Ubuntu** provisionado via Terraform
- ✅ **Apache2** instalado e configurado via Ansible
- ✅ **Página web personalizada** acessível em `http://IP_DA_INSTANCIA`
- ✅ **Firewall configurado** para permitir tráfego HTTP/HTTPS
- ✅ **Automação completa** sem intervenção manual

---

## 👨‍💻 Autor

**Pedro Henrique Barros**  
Especialização em Engenharia de Software com DevOps - UNIFOR
