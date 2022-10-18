locals {
  # Need to update the storage tags if the environment tag is updated with the rover command line
  tags = try(var.settings.tags, null) == null ? null : try(var.settings.tags.environment, null) == null ? var.settings.tags : merge(lookup(var.settings, "tags", {}), { "environment" : var.global_settings.environment })
}

resource "azurerm_backup_protected_vm" "backup" {
  resource_group_name = try(var.settings.resource_group_name, null)
  recovery_vault_name = try(var.settings.recovery_vault_name, null)
  backup_policy_id    = try(var.settings.backup_policy_id, null)
  source_vm_id        = try(var.settings.source_vm_id, null)
}
