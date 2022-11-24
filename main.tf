provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


#### INPUT VARIABLE SECTION ####

variable "accountId" {
  type        = string
  description = "Harness SAAS account id"
}

variable "delegateToken" {
  type        = string
  description = "Harness SAAS delegate token"
}


variable "delegateName" {
  type        = string
  description = "Harness delegate name"
}

variable "delegateDockerImage" {
  type        = string
  description = "Harness delegateDockerImage i.e. harness/delegate:22.11.77435"
}

variable "delegate_namespace" {
  type        = string
  description = "Delegate Namespace"
}


variable "managerEndpoint" {
  type        = string
  description = "Harness SAAS API endpoint i.e. https://app.harness.io/gratis"
}

variable "tags" {
  type        = string
  description = "Harness tags that will be used to identify delegate"
}

variable "description" {
  type        = string
  description = "Harness description that will be used to identify delegate"
}

variable "k8sPermissionsType" {
  type        = string
  description = "Specify access for delegate, CLUSTER_ADMIN, CLUSTER_VIEWER and NAMESPACE_ADMIN are valid entries"
}

variable "replicas" {
  type        = string
  description = "number of delegate replicas"
}

variable "cpu" {
  type        = string
  description = "0.5"
}

variable "memory" {
  type        = string
  description = "2048"
}

variable "initScript" {
  type        = string
  description = "Initscript for installing delegate utilities"
}

variable "javaOpts" {
  type        = string
  description = "javaOpts should be -Xms64M"
}

variable "securityContext" {
  type        =  string
  description = "runAsRoot boolean"
}



resource "helm_release" "harness-delegate-ng" {
  name       = "harness-delegate-ng"
  repository = "https://app.harness.io/storage/harness-download/harness-helm-charts"
  chart      = "harness-delegate-ng"
  create_namespace = true
  namespace = var.delegate_namespace

set {
    name  = "accountId"
    value = var.accountId
}

set {
    name  = "delegateToken"
    value = var.delegateToken
}

set {
    name  = "delegateName"
    value = var.delegateName
}

set {
    name  = "delegateDockerImage"
    value = var.delegateDockerImage
}

set {
    name  = "managerEndpoint"
    value = var.managerEndpoint
}

set {
    name  = "tags"
    value = var.tags
}

set {
    name  = "description"
    value = var.description
}

set {
    name  = "k8sPermissionsType"
    value = var.k8sPermissionsType
}

set {
    name  = "replicas"
    value = var.replicas
}

set {
    name  = "cpu"
    value = var.cpu
}

set {
    name  = "memory"
    value = var.memory
}

set {
    name  = "initScript"
    value = var.initScript
}

set {
    name  = "javaOpts"
    value = var.javaOpts
}


set {
    name  = "securityContext.runAsRoot"
    value = var.securityContext
}



}
