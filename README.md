# workspace-devops-automation

Automação para provisionamento de infraestrutura no Azure com Terraform e configuração de VM com Ansible. Cria uma VM, configura rede e instala Docker; o playbook também inicializa um container Java (iesodias/java-api) como exemplo.

Principais tecnologias: Terraform (AzureRM) e Ansible.

Estrutura resumida
- infra/: código Terraform para criar resource group, VNet, subnet, VM, IP público e NSG.
- ansible/: playbook Ansible para instalar Docker e executar um container Java.

Como usar (rápido)
1. Pré-requisitos: Azure CLI (autenticado), Terraform, Ansible e acesso ao storage backend do Terraform.
2. Provisionar infra (dentro de infra/):

```bash
cd infra
terraform init
# recomenda-se revisar o arquivo variable.tf e mudar senhas/padrões antes de aplicar
terraform apply -var "admin_password=SEU_PASSWORD" -auto-approve
```

3. Executar playbook (dentro de ansible/):

- Crie um inventory com o IP público da VM retornado pelo Terraform, por exemplo `inventory.ini` contendo a linha:

```ini
[vm]
X.X.X.X ansible_user=azureuser
```

- Rode o playbook:

```bash
cd ../ansible
ansible-playbook -i ../infra/inventory.ini playbook.yml --ask-become-pass
```
