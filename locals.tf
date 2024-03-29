locals {
  #  deployments = var.celery_enabled == false ? var.deployments : merge(var.deployments, {
  deployments = merge({
    "celery-beat" = var.celery_beat_defaults
  }, {
    "celery-worker" = var.celery_worker_defaults
  }, var.deployments)

  common_labels = merge(
    {
      "app.kubernetes.io/part-of" : var.name
      "app.kubernetes.io/managed-by" : "terraform"
    },
    var.extra_labels,
  )

  ingress_annotations = merge({
    "kubernetes.io/ingress.class"                       = "nginx"
    "nginx.ingress.kubernetes.io/tls-acme"              = "true"
    "nginx.ingress.kubernetes.io/ssl-redirect"          = "true"
    "nginx.ingress.kubernetes.io/proxy-body-size"       = "30m"
    "nginx.ingress.kubernetes.io/proxy-read-timeout"    = "180s"
    "nginx.ingress.kubernetes.io/proxy-write-timeout"   = "180s"
    "nginx.ingress.kubernetes.io/proxy-connect-timeout" = "180s"
    "cert-manager.io/cluster-issuer"                    = "letsencrypt-prod"
    "nginx.ingress.kubernetes.io/enable-cors" : "true"
    "nginx.ingress.kubernetes.io/cors-allow-methods" : "DELETE, GET, OPTIONS, PATCH, POST, PUT"
    "nginx.ingress.kubernetes.io/cors-allow-headers" : "accept, accept-encoding, accept-language, cache-control, authorization, content-type, dnt, origin, user-agent, x-csrftoken, x-requested-with",
    #    "nginx.ingress.kubernetes.io/cors-allow-origin" : "https://client.${local.domain},https://expert.${local.domain}, https://book.${local.domain}"
    "kubernetes.io/tls-acme" : "true"
  }, var.ingress_annotations)
}
