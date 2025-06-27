# Kubernetes 프로바이더 설정
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Spring Boot Deployment
resource "kubernetes_deployment" "boot002dep" {
  metadata {
    name = "boot002dep"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "boot002kube"
      }
    }

    template {
      metadata {
        labels = {
          app = "boot002kube"
        }
      }

      spec {
        container {
          image = "coffit23/k8s_boot_ing:latest"
          name  = "boot-container"
          image_pull_policy = "Always"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

# Spring Boot Service
resource "kubernetes_service" "boot002ser" {
  metadata {
    name = "boot002ser"
  }

  spec {
    selector = {
      app = "boot002kube"
    }

    port {
      port        = 8001
      target_port = 8080
    }

    type = "ClusterIP"
  }
}

# React (Next.js) Deployment
resource "kubernetes_deployment" "react002dep" {
  metadata {
    name = "react002dep"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "react002kube"
      }
    }

    template {
      metadata {
        labels = {
          app = "react002kube"
        }
      }

      spec {
        container {
          image = "coffit23/k8s_react_ing:latest"
          name  = "react-container"
          image_pull_policy = "Always"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

# React (Next.js) Service
resource "kubernetes_service" "react002ser" {
  metadata {
    name = "react002ser"
  }

  spec {
    selector = {
      app = "react002kube"
    }

    port {
      port        = 8000
      target_port = 3000
    }

    type = "ClusterIP"
  }
}

# Ingress
resource "kubernetes_ingress_v1" "sw_camp_ingress" {
  metadata {
    name = "sw-camp-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect"    = "false"
      "nginx.ingress.kubernetes.io/rewrite-target"  = "/$2"
    }
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      http {
        path {
          path      = "/()(.*)$"
          path_type = "ImplementationSpecific"

          backend {
            service {
              name = "react002ser"
              port {
                number = 8000
              }
            }
          }
        }

        path {
          path      = "/boot(/|$)(.*)$"
          path_type = "ImplementationSpecific"

          backend {
            service {
              name = "boot002ser"
              port {
                number = 8001
              }
            }
          }
        }
      }
    }
  }
}
