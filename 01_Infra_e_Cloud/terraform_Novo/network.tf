#Autor: Tiago André Lopes
#Email: tiago.lopes@aluno.faculdadeimpacta.com.br
#Disciplina: Infrastructure and Cloud Computing
#Aula 02: SubDivisão para configuração de Rede

resource "azurerm_virtual_network" "example-aulaes22" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Production"
    turma = "es22"
    faculdade = "impacta"
  }
}

resource "azurerm_subnet" "example-sb-aulaes22" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example-aulaes22.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "example-msg-aulaes22" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface" "example-nic-aulaes22" {
  name                = "example-nic"
  #name                = "example-nic2"
  location            = azurerm_resource_group.example.location
  #location            = "eastus"
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "nic-es22"
    subnet_id                     = azurerm_subnet.example-sb-aulaes22.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.example-ip-aulaes22.id
  }
}