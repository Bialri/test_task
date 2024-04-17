
variable "region" {
  type = string
  default = "us-west-2"
}

variable "availability_zone_names" {
  type = list(string)
  default = ["us-west-2a","us-west-2b"]
}