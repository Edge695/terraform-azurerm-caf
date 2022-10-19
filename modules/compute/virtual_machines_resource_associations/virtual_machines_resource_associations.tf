resource "azurerm_backup_protected_vm" "backup" {
   
  resource_group_name = var.resource_group_name
  recovery_vault_name = try(var.settings.backup.recovery_vault_name)
  source_vm_id = try(var.settings.backup.source_vm_id)
  backup_policy_id = try(var.settings.backup.backup_policy_id)
}
