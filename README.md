# TerraformDelegateAutomation

### Introduction 
MVP Terraform manifest for provisioning a helm delegate (immutable)
Purpose is to ease and automate onboarding through configuration as code .

Feel free to hack and change as you see fit !


### Requirements 

The terraform manifest uses the official kubernetes provider from Hashicorp . It is set to read your kubeconfig file 
you will need to provide path and context . Alteratively use what ever credential helper or auth configuration that suits you .

https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs

With this provider it will create exaclty the same kubernetes objects as the kubernetes as the HELM chart .
(Namespace , Cluster role binding , secret and statefulset) .


### Input parameters required for provisioning (defined in .tfvars and mirrors the helm values.yaml file)

Examples : 

accountId = "xxxxxxxxxxxxxx"

delegateToken = "xxxxxxxxxxxxxxxxxxxxxxxx"

delegateName = "helm"

delegate_namespace = "harness-delegate-ng"

delegateDockerImage = "harness/delegate:22.11.77435"

managerEndpoint = "https://app.harness.io/gratis"

tags = ""

description = ""

k8sPermissionsType = "CLUSTER_ADMIN"

replicas = "1"

cpu = "0.5"

memory = "2048" 

initScript = ""

javaOpts = "-Xms64M"

securityContext = "runAsRoot: false"
