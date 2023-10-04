

resource "oci_core_instance" "bkyinstance01" {
  availability_domain = "fBYL:US-SANJOSE-1-AD-1"
  compartment_id      = var.compartment_ocid
  display_name        = "WebServer01"
  shape               = "VM.Standard2.1"


  create_vnic_details {
    subnet_id    = oci_core_subnet.bkysubnet.id
    display_name = "webserver01-nic"
  }
  source_details {
    source_type             = "image"
    source_id               = "ocid1.image.oc1.us-sanjose-1.aaaaaaaaj54obnpdo6hzhs4p7x2sj4g2iuldtqqklov6dnilpddzo26myqoa"
    boot_volume_size_in_gbs = "50"
  }

  metadata = {
    ssh_authorized_keys = chomp(file(var.ssh_public_key))
    
  }
}