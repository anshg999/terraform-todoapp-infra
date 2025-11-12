locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoAppTeam"
    "Environment" = "dev"
  }
}


module "rg" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "rg-dev-todoapp-01ansh"
  rg_location = "centralindia"
  rg_tags     = local.common_tags
}

module "acr" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_container_registry"
  acr_name   = "acrdevtodoapp01ansh"
  rg_name    = "rg-dev-todoapp-01ansh"
  location   = "centralindia"
  tags       = local.common_tags
}

module "sql_server" {
  depends_on      = [module.rg]
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "sql-dev-todoapp-01ansh"
  rg_name         = "rg-dev-todoapp-01ansh"
  location        = "centralindia"
  admin_username  = "devopsadmin"
  admin_password  = "P@ssw01rd@123"
  tags            = local.common_tags
}

module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "sqldb-dev-todoappansh"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = local.common_tags
}

module "aks" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_kubernetes_cluster"
  aks_name   = "aks-dev-todoappansh"
  location   = "centralindia"
  rg_name    = "rg-dev-todoapp-01ansh"
  dns_prefix = "aks-dev-todoapp"
  tags       = local.common_tags
}


module "pip" {
  source   = "../../modules/azurerm_public_ip"
  pip_name = "pip-dev-todoappansh"
  rg_name  = "rg-dev-todoapp-01ansh"
  location = "centralindia"
  sku      = "Basic"
  tags     = local.common_tags
}
module "stg" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_storage_account"
  sa_name    = "anshstg1234567"
  rg_name    = "rg-dev-todoapp-01ansh"
  location   = "centralindia"
  tags       = local.common_tags
}
