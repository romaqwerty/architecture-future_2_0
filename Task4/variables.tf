variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "zone" {
  type        = string
  description = "Yandex Cloud availability zone"
  default     = "ru-central1-b"
}

variable "image_family" {
  type        = string
  description = "Operating system image family"
  default     = "ubuntu-2204-lts"
}

variable "disk_name" {
  type        = string
  description = "Boot disk name"
  default     = "app-disk"
}

variable "disk_type" {
  type        = string
  description = "Boot disk type"
  default     = "network-ssd"
}

variable "disk_id" {
  type        = string
  description = "Existing boot disk ID; when null, the managed disk is used"
  default     = null
  nullable    = true
}

variable "disk_size" {
  type        = number
  description = "Disk size, Gbs"
  default     = 20
}

variable "network_name" {
  type        = string
  description = "VPC network name"
  default     = "app-network"
}

variable "subnet_name" {
  type        = string
  description = "VPC subnet name"
  default     = "app-subnet"
}

variable "instance_name" {
  type        = string
  description = "Compute instance name"
  default     = "app-future-vm"
}

variable "cores" {
  type        = number
  description = "Cpu cores"
  default     = 2
}

variable "ram" {
  type        = number
  description = "RAM size, Gbs"
  default     = 2
}

variable "public_key" {
  type        = string
  description = "Path to SSH public key"
  default     = "/path/to/public_key"
}
