resource "kubernetes_persistent_volume_claim_v1" "pgdata" {
  count = var.postgres_enabled ? 1 : 0
  metadata {
    name      = "postgres-data"
    namespace = var.namespace
    labels    = local.common_labels
  }
  wait_until_bound = false
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.postgres_storage_size
      }
    }
  }
}
