variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Nome do key pair já criado na AWS (usado para SSH)"
  type        = string
  default     = "EC2 Tutorial"
}

variable "ami_id" {
  description = "AMI ID para a instância EC2"
  type        = string
  default     = "ami-0b6c6ebed2801a5cb" # Ubuntu Server 24.04 LTS Free Tier
}