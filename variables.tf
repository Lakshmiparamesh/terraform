variable "region1" {
  default = "ap-south-1"
}

variable "region2" {
  default = "us-east-1"
}

variable "ami_region1" {
  default = "PASTE_YOUR_MUMBAI_AMI_ID_HERE"
}

variable "ami_region2" {
  default = "PASTE_YOUR_VIRGINIA_AMI_ID_HERE"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name_region1" {
  default = "my-key-mumbai"
}

variable "key_name_region2" {
  default = "my-key-virginia"
}