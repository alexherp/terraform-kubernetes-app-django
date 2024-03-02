output "hpa_name" {
  description = "The name of the deployed HPA."
  value       = kubernetes_horizontal_pod_autoscaler_v1.hpa.metadata.0.name
}

output "ingress" {
  description = "All the ingress values."
  value       = kubernetes_ingress_v1.ingress
}

output "persistent_volume_claim_name" {
  description = "The persistent volume claim name."
  value       = kubernetes_persistent_volume_claim_v1.pgdata.0.metadata.0.name
}

output "service_account_name" {
  description = "The name of the service account."
  value       = kubernetes_service_account_v1.service_account.metadata.0.name
}
