resource "kind_cluster" "default" {
  name            = "test-cluster"
  node_image      = "kindest/node:v1.27.1"
  kubeconfig_path = pathexpand("~/.kube/config")
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    node {
      role = "control-plane"
      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }
    }
    node {
      role = "worker"
    }
  }

}
