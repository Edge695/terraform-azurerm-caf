resource "azurerm_backup_protected_vm" "vmbackup" {
  for_each            = try(var.settings.resource_association.Backup, {})
  resource_group_name = try(each.value.rg_key[var.settings.backup.vault_key].resource_group_name, null)
  recovery_vault_name = try(each.value.vault_key[var.settings.backup.vault_key].name, null)
  backup_policy_id    = try(each.value.policy_key[var.settings.backup.policy_key].id, null)
  source_vm_id        = try(each.value.vm_key[var.settings.virtual_machines.vm_key].id, null)
}
