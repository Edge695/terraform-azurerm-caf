resource "azurerm_backup_protected_vm" "backup" {
  for_each            = try(var.settings.resource_association, {})
  resource_group_name = try(each.value.resource_group_name, null)
  recovery_vault_name = try(each.value.recovery_vault_name, null)
  backup_policy_id    = try(each.value.backup_policy_id, null)
  source_vm_id        = try(each.value.source_vm_id, null)
}
