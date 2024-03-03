output "hpa_name" {
  description = "The name of the deployed HPA."
  value       = module.django_kubernetes_app.hpa
}

output "ingress" {
  description = "All the ingress values."
  value       = module.django_kubernetes_app.ingress
}

output "persistent_volume_claim_name" {
  description = "The persistent volume claim name."
  value       = module.django_kubernetes_app.pgdata
}

output "service_account_name" {
  description = "The name of the service account."
  value       = module.django_kubernetes_app.service_account
}
