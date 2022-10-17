module "resource_associations" {
  source = "./modules/compute/virtual_machine"
  global_settings = local.global_settings
  settings        = each.value
}
