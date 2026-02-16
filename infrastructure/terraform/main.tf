# Configure Kubernetes Provider
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Create Namespace
resource "kubernetes_namespace" "skillsync" {
  metadata {
    name = "skillsync"
  }
}
