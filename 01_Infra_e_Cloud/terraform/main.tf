#Autor: Tiago André Lopes
#Email: tiago.lopes@aluno.faculdadeimpacta.com.br
#Disciplina: Infrastructure and Cloud Computing
#Aula 02: SubDivisão para configuração Provider e Resource Group

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
