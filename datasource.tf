data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.compartment_ocid
}

data "oci_core_images" "bky-images" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
  shape                    = "VM.Standard.E2.1.Micro"

}
