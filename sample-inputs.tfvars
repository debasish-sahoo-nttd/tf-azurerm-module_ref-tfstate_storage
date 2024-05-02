resource_group_name = "dso-test-rg-001"
location = "eastus"
account_tier = "Standard"
account_replication_type = "LRS"
access_tier = "Hot"
account_kind = "StorageV2"
blob_delete_retention_policy = 0
blob_versioning_enabled = true
blob_change_feed_enabled = true
blob_last_access_time_enabled = true
blob_container_delete_retention_policy = 0
container_access_type = "private"
tags = {
  environment = "sandbox"
  owner = "Debasish"
}
storage_accounts = {
  "akstfstatedev" = {
    storage_account_name = "akstfstatedev"
    storage_containers = ["vnet", "acr"]
  }
  "adotfstatedev" = {
    storage_account_name = "adotfstatedev"
    storage_containers = ["privatedns", "acr", "msi", "aks"]
  }
}