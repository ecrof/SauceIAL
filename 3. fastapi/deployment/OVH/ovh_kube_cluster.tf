# https://registry.terraform.io/providers/ovh/ovh/latest/docs
#  !!! Do not forget to clean up everything at the end, it could cost money $ !!!

# service_name: it is the ID of your Public Cloud project.
# b54c099524cd4f09a5902b8467291a9a

resource "ovh_cloud_project_kube" "mykube" {
   service_name = "${var.service_name}"
   name         = "UCoachMe"
   region       = "DE1"
   version      = "1.22"
}

resource "ovh_cloud_project_kube_nodepool" "pool" {
   service_name  = "${var.service_name}"
   kube_id       = ovh_cloud_project_kube.my_kube_cluster.id
   name          = "my-pool" //Warning: "_" char is not allowed!
   flavor_name   = "b2-7"
   desired_nodes = 1
   max_nodes     = 1
   min_nodes     = 1
}