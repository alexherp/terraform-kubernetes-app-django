resource "kubernetes_service_account_v1" "service_account" {
  depends_on = [kubernetes_namespace_v1.namespace]
  count      = var.service_account_name != null ? 1 : 0
  metadata {
    name        = var.service_account_name
    namespace   = var.namespace
    labels      = local.common_labels
    annotations = {
      "iam.gke.io/gcp-service-account" = var.service_account_name
    }
  }
  automount_service_account_token = false
}
