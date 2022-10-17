module "virtual_machines_resource_associations" {
  source = "./modules/compute/virtual_machines_resource_associations"
  
  for_each = {
    for key, value in try(var.resource_associations, {}) : key => value
    if try(value.reuse, false) == false
  }

  resource_group_name = each.value.name
  settings            = each.value
  global_settings     = local.global_settings
}

output "virtual_machines_resource_associations" {
    value = module.virtual_machines_resource_associations
}
