resource "azurerm_backup_protected_vm" "backup" {
   
  resource_group_name = coalesce(
    try(var.settings.backup.resource_group_name, null),
  )
  
  recovery_vault_name = coalesce(
    try(var.settings.backup.recovery_vault_name, null),
  )
  
  source_vm_id = coalesce(
    try(var.settings.backup.source_vm_id, null),
  )
   
  backup_policy_id = coalesce(
    try(var.settings.backup.backup_policy_id, null),
  )
}
