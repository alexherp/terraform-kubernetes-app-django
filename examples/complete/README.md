
# Complete Django Application Deployment on Kubernetes

This example demonstrates deploying a Django application on Kubernetes using the Terraform Kubernetes Django App Module. It showcases the module's capabilities, including configuring deployments, services, horizontal pod autoscaling (HPA), persistent volume claims (PVCs), pod disruption budgets (PDBs), secrets, and ingress resources.

## Usage

To deploy this example, follow these steps:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Be aware that this example may create resources which can incur costs on your GCP or AWS bill. Use \`terraform destroy\` to remove these resources when they are no longer needed.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.1 |
| kubernetes | >= 1.11.1 |
| google | >= 3.50 |
| aws | >= 3.27 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 1.11.1 |
| google | >= 3.50 |
| aws | >= 3.27 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| module_django_kubernetes_app | github.com/alexherp/terraform-kubernetes-app-django?ref=stable | n/a |

## Resources

| Name | Type |
|------|------|
| kubernetes_deployment | resource |
| kubernetes_service | resource |
| google_storage_bucket | resource |
| aws_s3_bucket | resource |
| kubernetes_namespace | resource |
| kubernetes_horizontal_pod_autoscaler | resource |
| kubernetes_ingress | resource |
| kubernetes_secret | resource |
| kubernetes_config_map | resource |
| kubernetes_service_account | resource |
| kubernetes_pod_disruption_budget | resource |
| kubernetes_persistent_volume_claim | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| hpa_name | The name of the deployed HPA. |
| ingress | All the ingress values. |
| persistent_volume_claim_name | The persistent volume claim name. |
| service_account_name | The name of the service account. |


