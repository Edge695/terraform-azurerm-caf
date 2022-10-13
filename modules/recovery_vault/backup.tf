
resource "azurerm_backup_protected_vm" "backup" {
  for_each = try(var.settings.backup, {})
  resource_group_name   = try(var.settings.backup.rg_key.resource_group_name, null)
  recovery_vault_name   = try(var.azurerm_recovery_services_vault.asr.name, null)
  backup_policy_id      = try(var.settings.backup.policy_key.id, null)
  source_vm_id          = try(var.settings.backup.source_vm_id, null)
}
