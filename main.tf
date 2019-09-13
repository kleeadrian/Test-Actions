
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


resource "azurerm_resource_group" "rsg_app_plan" {
  name     = "api-rg-pro"
  location = "Australia East"
}

resource "azurerm_app_service_plan" "app_plan_test" {
  name                = "api-appserviceplan-pro"
  location            = "${azurerm_resource_group.rsg_app_plan.location}"
  resource_group_name = "${azurerm_resource_group.rsg_app_plan.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "appservice-test"
  location            = "${azurerm_resource_group.rsg_app_plan.location}"
  resource_group_name = "${azurerm_resource_group.rsg_app_plan.name}"
  app_service_plan_id = "${azurerm_app_service_plan.app_plan_test.id}"
}
