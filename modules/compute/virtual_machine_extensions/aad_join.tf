resource "azurerm_virtual_machine_extension" "aadjoin" {
  for_each                   = var.extension_name == "AADLoginForWindows" ? toset(["enabled"]) : toset([])
  name                       = "AADLoginForWindows"
  virtual_machine_id         = var.virtual_machine_id
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  type                       = "AADLoginForWindows"
  type_handler_version       = try(var.extension.type_handler_version, "1.0")
  auto_upgrade_minor_version = try(var.extension.auto_upgrade_minor_version, true)

  lifecycle {
    ignore_changes = [
      settings,
      protected_settings
    ]
  }
  settings           = <<SETTINGS
      {
          "mdmId": "${var.virtual_machine_principal_id}"
      }
  SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
      {

      }
  PROTECTED_SETTINGS
}
