variable vpc_cidr_block {
  default = "10.0.0.0/16"
}
variable subnet_cidr_block {
  default = "10.0.10.0/24"
}
variable avail_zone {
  default = "us-east-1a"
}
variable env_prefix {
  default = "dev"
}
variable my_ip {
  default = "85.246.32.98/32"
}
variable jenkins_ip {
  default = "138.197.151.4/32"
}
variable instance_type {
  default = "t3.small"
}
variable region {
  default = "us-east-1"
}
variable public_key_location {
  default = "C:/Users/varmav/.ssh/id_ed25519.pub" 
}
