resource "azurerm_backup_protected_vm" "backup" {
   
  resource_group_name = coalesce(
    try(var.settings.backup.backup_vault_rg, null),
  )
  
  recovery_vault_name = coalesce(
    try(var.settings.backup.backup_vault_name, null),
  )
  
  # source_vm_id = local.os_type == "linux" ? try(azurerm_linux_virtual_machine.vm["linux"].id, null) : try(azurerm_windows_virtual_machine.vm["windows"].id, null)
  
  backup_policy_id = coalesce(
    try(var.settings.backup.backup_policy_id, null),
  )
}
