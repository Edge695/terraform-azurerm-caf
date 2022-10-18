module "virtual_machines_resource_association" {
  source   = "./modules/compute/virtual_machines_resource_associations"
  for_each = var.resource_associations

  global_settings    = local.global_settings
  client_config      = local.client_config
  settings           = each.value
}
