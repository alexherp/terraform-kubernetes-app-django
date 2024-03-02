output "hpa_name" {
  description = "The name of the deployed HPA."
  value       = kubernetes_horizontal_pod_autoscaler.main.metadata[0].name
}
