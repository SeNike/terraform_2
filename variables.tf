variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop-web"
  description = "VPC network & subnet name"
}

variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM OS image"
}
  
variable "vm_web_platform" {
  type        = string
  default     = "standard-v3"
  description = "VM platform"
}

variable "vms_resources" {
  type = map(any)
 description = "VM resourses map"

}

variable "metadata" {
  type = map(string)
  description = "Access key map"

}

variable "test" {
  type = list(map(list(string)))
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "/home/se/.ssh/yckey"
  description = "ssh-keygen -t ed25519"
}

