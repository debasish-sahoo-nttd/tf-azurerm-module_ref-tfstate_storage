// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "storage_accounts" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-storage_account?ref=1.0.0"

  for_each = var.storage_accounts

  storage_account_name = each.value.storage_account_name

  resource_group_name = var.resource_group_name
  location            = var.location
  account_tier        = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier         = var.access_tier
  account_kind        = var.account_kind

  blob_delete_retention_policy = var.blob_delete_retention_policy
  blob_versioning_enabled      = var.blob_versioning_enabled
  blob_change_feed_enabled     = var.blob_change_feed_enabled
  blob_last_access_time_enabled = var.blob_last_access_time_enabled
  blob_container_delete_retention_policy = var.blob_container_delete_retention_policy

  storage_containers = { for container in each.value.storage_containers : container => {
    name = container
    container_access_type = var.container_access_type}
  }

  tags = var.tags
}
