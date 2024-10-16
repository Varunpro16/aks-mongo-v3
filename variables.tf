# variables.tf

variable "rg" {
  description = "Resource Group"
  type        = string
}

variable "node_count" {
  description = "Node Count"
  type        = number
}

variable "vm_size" {
  description = "Name of the EKS cluster"
  type        = string
}


variable "cluster_location" {
  description = "Location EKS cluster"
  type        = string
}


variable "cosmodb_location" {
  description = "Location CosmoDB"
  type        = string
}

variable "vpc_location" {
  description = "Location for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_address_range" {
  description = "Address ranges for the VPC"
  type        = list(string)
}
