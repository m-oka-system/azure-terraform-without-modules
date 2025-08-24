terraform {
  # Terraform のバージョン
  required_version = "~> 1.11"

  # リソースプロバイダーのバージョン
  required_providers {
    azurerm = {
      version = "~>4.0"
      source  = "hashicorp/azurerm"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  # サブスクリプション ID (環境変数 ARM_SUBSCRIPTION_ID を設定していない場合は必要)
  # subscription_id = "00000000-0000-0000-0000-000000000000"

  # リソースプロバイダーの登録モード (core, extended, all, none, legacy)
  resource_provider_registrations = "none"

  # サブスクリプションに明示的に登録するリソースプロバイダー
  resource_providers_to_register = [
    "Microsoft.Advisor",
    "Microsoft.DBforMySQL",
    "Microsoft.KeyVault",
    "Microsoft.Network",
    "Microsoft.Web",
  ]
  features {
    key_vault {
      # Azure Key Vault の論理削除を無効にする
      purge_soft_delete_on_destroy = true
    }
    resource_group {
      # リソースグループ内にリソースがあっても削除する
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "http" {}

# Terraform を実行するアカウントの情報を取得する
data "azurerm_client_config" "current" {}

# クライアントの IP アドレスを取得する
data "http" "ipify" {
  url = "http://api.ipify.org"
}
