# Variables
variable "aws_region" {
  description = "The AWS Region you will deploy infrastructure"
  type        = "string"
  default     = "eu-west-3"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = "string"
  default     = "80"
}

variable "key_name" {
  description = "Name of the key_pair to connect"
  type        = "string"
}
