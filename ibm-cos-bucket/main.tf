
resource "ibm_resource_group" "cos_group" {
  name     = "my-resource-dev"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = "my-cos-instance-new"
  resource_group_id = ibm_resource_group.cos_group.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}

resource "ibm_cos_bucket" "standard-ams03" {
  bucket_name          = "my-ibm-bucket"
  resource_instance_id = ibm_resource_instance.cos_instance.id
  region_location      = "us-south"
  storage_class        = "standard"
}

