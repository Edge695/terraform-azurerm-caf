module "resource_association" {
  source = "./modules/compute/resource_association"

  for_each = {
    try(local.resource_association.vmbackup, {}) : key => value
    if try(value.resource_association.vmbackup, null) != null
  }

  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = var.source_vm_id
  backup_policy_id    = var.backup_policy_id
}
