#Autor: Tiago André Lopes
#Email: tiago.lopes@aluno.faculdadeimpacta.com.br
#Disciplina: Infrastructure and Cloud Computing
#Atividade 02: Subir uma máquina virtual no Azure, AWS ou GCP instalando o MySQL e que esteja acessível 
# no host da máquina na porta 3306, usando Terraform

resource "azurerm_public_ip" "example-ip-aulaes22" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.example-nic-aulaes22.id
  network_security_group_id = azurerm_network_security_group.example-msg-aulaes22.id
}

resource "azurerm_virtual_machine" "example-vm-aulaes22" {
  name                  = "es22-vm"
  location              = azurerm_resource_group.example.location
  #location              = "eastus"
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example-nic-aulaes22.id]
  vm_size               = "Standard_DS1_v2"
  #vm_size               = "Standard_D2s_v3"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

output "public_ip_vm" {
  value = azurerm_public_ip.example-ip-aulaes22.ip_address
}