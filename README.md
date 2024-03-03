
# Terraform Kubernetes Django App Module

This Terraform module deploys a Django application on Kubernetes. It includes configurations for deployments, services, horizontal pod autoscaling (HPA), persistent volume claims (PVCs), pod disruption budgets (PDBs), secrets, and ingress resources.

## Usage

```hcl
module "django_kubernetes_app" {
  source = "path/to/terraform-kubernetes-app-django"

  # Add your variables here
}
```

## Requirements

| Name | Version  |
|------|----------|
| terraform | >= 1.3.0 |
| kubernetes | >= 1.24  |

## Providers

| Name | Version  |
|------|----------|
| kubernetes | >= 2.4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_s3_name | Create and use AWS S3 | string | null | no |
| celery_db_index | - | - | "2" | no |
| celery_enabled | A short-hand for adding celery-beat and celery-worker deployments | - | true | no |
| celery-beat | - | - | {see below} | no |
| celery-worker | - | - | {see below} | no |
| cloudflare_enabled | Create cloudflare records if true | bool | true | no |
| web | - | map | {see below} | no |
| redis_db_index | - | - | "1" | no |
| redis_enabled | Create a redis database deployment | bool | false | no |
| redis_resources_limits_cpu | - | string | null | no |
| redis_resources_limits_memory | - | string | null | no |
| redis_resources_requests_cpu | - | string | "50m" | no |
| redis_resources_requests_memory | - | string | "128Mi" | no |
| secret_env | A map of extra secret environment variables | map(string) | - | no |
| security_context_enabled | - | bool | false | no |
| security_context_fsgroup | - | - | null | no |
| security_context_gid | - | - | 101 | no |
| security_context_uid | - | - | 101 | no |
| service_account_email | Service account email | any | - | no |
| service_account_name | Name of the kubernetes service account if any | string | null | no |
| volumes | Volume configuration | any | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| hpa_name | The name of the deployed HPA. |
| ingress | All the ingress values. |
| persistent_volume_claim_name | The persistent volume claim name. |
| service_account_name | The name of the service account. |

## Examples

- `example/`: Contains example usage of this module.

## Authors

Module managed by ahernper

## License

This project is licensed under the MIT License - see the LICENSE file for details.


## Detailed Inputs

The module includes a wide range of input variables to configure AWS S3, Celery (including beat and worker defaults), Cloudflare, deployments with customizable settings, GCP configurations, general settings like image names, tags, pull policies, and Kubernetes specifics like namespace, service accounts, and volume configurations.

For complex configurations such as `celery_beat_defaults`, `celery_worker_defaults`, and `deployments`, please refer to the Terraform module's `variables.tf` file for detailed structures and default values.

## Outputs

The module provides outputs for critical resources such as the horizontal pod autoscaler (HPA) name, ingress configurations, persistent volume claim (PVC) names, and service account names, allowing for easy integration with other Terraform configurations or modules.

Please refer to the `outputs.tf` file for a complete list of outputs provided by this module.
