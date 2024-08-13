variable "pm_user" {
  description = "The username for the proxmox user"
  type        = string
  sensitive   = false
  default     = "root@pam"

}
variable "pm_password" {
  description = "The password for the proxmox user"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = false
}

variable "pm_host" {
  description = "The hostname or IP of the proxmox server"
  type        = string
}

variable "pm_node_name" {
  description = "name of the proxmox node to create the VMs on"
  type        = string
  default     = "pve"
}

variable "pub_key" {
  description = "Public SSH key"
  type        = string
}

variable "num_k8s_masters_name" {
  description = "name of the vm node to create the VMs on"
  type        = string
  default     = "k8s-master"
}

variable "num_k8s_masters_host" {
  default = 1
}

variable "num_k8s_masters_cpu" {
  default = 2
}

variable "num_k8s_masters_mem" {
  default = "4096"
}

variable "num_k8s_masters_disk" {
  default = "32"
}

variable "num_k8s_workers_name" {
  description = "name of the vm node to create the VMs on"
  type        = string
  default     = "k8s-workers"
}

variable "num_k8s_workers_host" {
  default = 2
}

variable "num_k8s_workers_cpu" {
  default = 2
}

variable "num_k8s_workers_mem" {
  default = "2048"
}

variable "num_k8s_workers_disk" {
  default = "32"
}

variable "tamplate_vm_name" {}

variable "master_ips" {
  description = "List of ip addresses for master nodes"
  type        = list(string)
}

variable "worker_ips" {
  description = "List of ip addresses for worker nodes"
  type        = list(string)
}

variable "networkrange" {
  default = 24
}

variable "gateway" {
  default = "192.168.1.1"
}
