locals {
  # 共通の変数
  common = {
    tags = {
      project = var.common.project
      env     = var.env
    }
  }
}
