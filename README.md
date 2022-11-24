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

accountId

delegateToken

delegateName

delegate_namespace

delegateDockerImage

managerEndpoint

tags

description

k8sPermissionsType

replicas

cpu

memory

initScript

javaOpts

securityContext
