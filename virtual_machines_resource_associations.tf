module "virtual_machines_resource_associations" {
  source   = "./modules/compute/virtual_machines_resource_associations"
  for_each = var.virtual_machines_resource_associations

  global_settings    = local.global_settings
  client_config      = local.client_config
  settings           = each.value
  base_tags          = try(local.global_settings.inherit_tags, false) ? try(local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group.key, each.value.resource_group_key)].tags, {}) : {}
}
  
output "virtual_machines_resource_associations" {
  value = module.virtual_machines_resource_associations
}
