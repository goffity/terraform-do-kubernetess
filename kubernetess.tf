# data "digitalocean_kubernetes_versions" "test_cluster_version" {
#   version_prefix = "1.25."
# }

resource "digitalocean_kubernetes_cluster" "test_cluster" {
  name         = var.k8s_clustername
  region       = var.region
  version      = var.k8s_version

  node_pool {
    name       = var.k8s_poolname
    size       = "s-2vcpu-2gb"
    node_count = var.k8s_count
    auto_scale = false
  }
}