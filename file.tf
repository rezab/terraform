variable "username" {}
variable "tenantName" {}
variable "password" {}
variable "region" {}


provider "openstack" {
  user_name   = var.username
  tenant_name = var.tenantName
  password    = var.password
  auth_url    = "http://vip.xaas.ir:5000/v3"
  region      = "var.region"
}

variable "instanceName" {}
variable "imageId" {}
variable "flavorId" {}
variable "networkId" {}
#variable "networkName" {}

resource "openstack_compute_instance_v2" "test-server" {
  name      = var.instanceName
  region    = "Tehran"
  flavor_id = var.flavorId

  block_device {
    uuid                  = var.imageId
    source_type           = "image"
    volume_size           = 40
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = false
  }

  network {
    uuid = var.networkId
#    name = var.networkName
#    fixed_ip_v4 = "94.182.191.141"
  }
}
