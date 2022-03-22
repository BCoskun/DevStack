terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.99.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "demo" {
  location = var.location
  name     = "first-azure-iac-demo"

  tags = {
    environment = "demo"
  }

}

resource "azurerm_virtual_network" "demo" {

  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  name                = "example-network"

  tags = {
    environment = "demo"
  }

}

#resource "azurerm_postgresql_server" "demo" {
#  name                = var.postgresql-admin.sys-name
#  location            = azurerm_resource_group.demo.location
#  resource_group_name = azurerm_resource_group.demo.name
#
#  administrator_login          = var.postgresql-admin.username
#  administrator_login_password = var.postgresql-admin.password
#
#  sku_name   = "GP_Gen5_2"
#  version    = "9.6"
#  storage_mb = 640000
#
#  backup_retention_days        = 7
#  geo_redundant_backup_enabled = true
#  auto_grow_enabled            = true
#
#  public_network_access_enabled    = false
#  ssl_enforcement_enabled          = true
#  ssl_minimal_tls_version_enforced = "TLS1_2"
#
#  tags = {
#    environment = "demo"
#  }
#
#}

resource "azurerm_storage_account" "demo" {
  name                     = "${var.prefix}sa"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "demo"
  }

}


resource "azurerm_mssql_server" "demo" {
  name                         = var.sql-admin.sys-name
  resource_group_name          = azurerm_resource_group.demo.name
  location                     = azurerm_resource_group.demo.location
  version                      = "12.0"
  administrator_login          = var.sql-admin.username
  administrator_login_password = var.sql-admin.password

  tags = {
    environment = "demo"
  }
}

resource "azurerm_mssql_database" "db-service1" {
  name      = "db-service1"
  server_id = azurerm_mssql_server.demo.id
  collation = "SQL_Latin1_General_CP1_CI_AS"

  max_size_gb                 = 5
  min_capacity                = 0.5
  read_replica_count          = 0
  read_scale                  = false
  sku_name                    = "GP_S_Gen5_1"
  auto_pause_delay_in_minutes = 60

  threat_detection_policy {
    disabled_alerts      = []
    email_account_admins = "Disabled"
    email_addresses      = []
    retention_days       = 0
    state                = "Disabled"
  }

  tags = {
    environment = "demo"
  }
}


resource "azurerm_mssql_database" "db-service2" {
  name      = "db-service2"
  server_id = azurerm_mssql_server.demo.id
  collation = "SQL_Latin1_General_CP1_CI_AS"

  max_size_gb                 = 5
  min_capacity                = 0.5
  read_replica_count          = 0
  read_scale                  = false
  sku_name                    = "GP_S_Gen5_1"
  auto_pause_delay_in_minutes = 60

  threat_detection_policy {
    disabled_alerts      = []
    email_account_admins = "Disabled"
    email_addresses      = []
    retention_days       = 0
    state                = "Disabled"
  }

  tags = {
    environment = "demo"
  }
}

resource "azurerm_mssql_database" "db-service3" {
  name      = "db-service3"
  server_id = azurerm_mssql_server.demo.id
  collation = "SQL_Latin1_General_CP1_CI_AS"

  max_size_gb                 = 5
  min_capacity                = 0.5
  read_replica_count          = 0
  read_scale                  = false
  sku_name                    = "GP_S_Gen5_1"
  auto_pause_delay_in_minutes = 60

  threat_detection_policy {
    disabled_alerts      = []
    email_account_admins = "Disabled"
    email_addresses      = []
    retention_days       = 0
    state                = "Disabled"
  }

  tags = {
    environment = "demo"
  }
}
