resource "azurerm_resource_group" "main" {
  name     = "rg-${var.common.project}-${var.env}"
  location = var.common.location

  tags = local.common.tags
}
