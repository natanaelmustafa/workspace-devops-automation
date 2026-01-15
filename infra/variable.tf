variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-vm-automation"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "admin-password" {
  description = "The admin password for the Linux VM"
  type        = string
  sensitive   = true
  default     = "NLd@19941614"
}