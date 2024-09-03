variable "default_zone_db" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.4.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_db" {
  type        = string
  default     = "develop-db"
  description = "VPC network & subnet name"
}

variable "vm_db_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM OS image"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v3"
  description = "VM platform"
}
