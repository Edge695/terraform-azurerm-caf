resource "azurerm_backup_protected_vm" "virtual_machine_resource_associations" {
  resource_group_name = try(var.settings.resource_group_name, null)
  recovery_vault_name = try(var.settings.recovery_vault_name, null)
  backup_policy_id    = try(var.settings.backup_policy_id, null)
  source_vm_id        = try(var.settings.source_vm_id, null)
}
