variable "common" {
  type = map(string)
  default = {
    project  = "terraform"
    location = "japaneast"
  }
}

variable "env" {
  type = string
}
