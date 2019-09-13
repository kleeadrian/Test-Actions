
provider "azurerm" {
  version = "=1.28.0"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "storage-aea"
    storage_account_name = "testgit01"
    container_name       = "terraform01"
    key                  = "terraform.tfstate"
  }
}


resource "azurerm_resource_group" "test" {
  name     = "api-rg-pro"
  location = "Australia East"
}

resource "azurerm_app_service_plan" "test" {
  name                = "api-appserviceplan-pro"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}
