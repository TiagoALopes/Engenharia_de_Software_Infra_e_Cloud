#Autor: Tiago André Lopes
#Email: tiago.lopes@aluno.faculdadeimpacta.com.br
#Disciplina: Infrastructure and Cloud Computing
#Atividade 02: Subir uma máquina virtual no Azure, AWS ou GCP instalando o MySQL e que esteja acessível 
# no host da máquina na porta 3306, usando Terraform

terraform{
    required_version = ">=0.13"

    required_providers {
      azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"
      }
    }
}

provider "azurerm" {
  skip_provider_registration = true
  features{
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-aula-es22"
  #location = "West US"
  location = "East US"
}
