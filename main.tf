
provider "azurerm" {
  version = "=1.28.0"
  
  client_id       = "350760b5-f41d-451f-9d6f-6fe55a472e00"
  client_secret   = "bf853ccc-0644-41af-aa73-bf16bec52055"
  subscription_id      = "c37cdda5-2d23-447a-bd44-2d1fdaa39e24"
  tenant_id            = "3057f563-061e-4eac-b932-79105b67fe9f"
}

terraform {
  backend "azurerm" {
    resource_group_name = "storage-aea"
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
