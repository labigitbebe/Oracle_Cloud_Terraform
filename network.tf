resource "oci_core_virtual_network" "bkyvcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = "10.11.0.0/16"
  dns_label      = var.vcn_dns_label
  display_name   = var.vcn_dns_label

}

resource "oci_core_internet_gateway" "bky-igw" {
  compartment_id = var.compartment_ocid
  display_name   = "${var.vcn_dns_label}-igw"
  vcn_id         = oci_core_virtual_network.bkyvcn.id

}

resource "oci_core_route_table" "bky-public_rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.bkyvcn.id
  display_name   = "${var.vcn_dns_label}-pubrt"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.bky-igw.id

  }

}

resource "oci_core_subnet" "bkysubnet" {
  availability_domain = ""
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.bkyvcn.id
  cidr_block          = "10.11.1.0/24"
  display_name        = var.dns_label
  dns_label           = var.dns_label
  route_table_id      = oci_core_route_table.bky-public_rt.id
  security_list_ids   = [oci_core_security_list.bky-seclist.id]
}


resource "oci_core_security_list" "bky-seclist" {
  display_name   = "bky-SL-public"
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.bkyvcn.id

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

}
