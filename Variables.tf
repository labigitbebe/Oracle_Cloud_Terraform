variable "tenancy_ocid" {}
variable "ssh_public_key" {}
variable "compartment_ocid" {}

variable "vcn_dns_label" {
  default = "bkyvcn01"
}

variable "dns_label" {
  default = "bkysubnet01"
}

variable "AD" {
  default = "1"
}
variable "region" {
  default = "us-sanjose-1"

}

variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaabbyzbw6fzrsgzba5w3vo5hziy2if6tmmgpimpaulb4i7cpxfathq"

}

variable "fingerprint" {
  default = "3c:89:04:4f:e9:37:11:b1:c1:60:9e:c3:87:f4:e3:d4"
}

variable "private_key_path" {
  type    = string
  default = "oracle_api_key.pem"
}

variable "private_key_path-p-ssh" {
  default = "/Users/gokhany/.ssh/oci-sshkey"
}
