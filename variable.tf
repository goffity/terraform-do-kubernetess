variable "do_token" {}
variable "region" {
  default = "spg1"
}
variable "k8s_clustername" {
  default = "tesl-clister"
}
variable "k8s_version" {
  default = "1.26.3-do.0"
}
variable "k8s_poolname" {
  default = "test-pool"
}

variable "k8s_count" {
  default = "1"
}