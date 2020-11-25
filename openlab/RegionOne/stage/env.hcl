# Set common variables for the environment. This is automatically pulled in in the root terragrunt.hcl configuration to
# feed forward to the child modules.
locals {
  environment = "stage" # name of the environment you use. e.g stage, prod or qa
  network     = ""      # name of the network to connect with the Internet

  # Rancher and Kubernetes
  # To access a VM, 'ssh -i ssh_private_key_path kubernetes_user@one-of-the-external-ips'
  # a key pair for accessing VMs
  ssh_public_key       = ""
  ssh_private_key_path = ""

  kubernetes_version      = "v1.17.3-rancher1-1"
  kubernetes_user         = "ubuntu"
  kubernetes_cluster_name = "rke_cluster"

  kubernetes_home = "${get_parent_terragrunt_dir()}"

  # Helm
  service_account = "tiller"
  namespace       = "kube-system"

  # NFS provisioner for kubernetes
  nfs_enabled = true

  # Keycloak
  keycloak_enabled = false
  olm_version      = "0.16.1" # Version of Operator Lifecycle Manager

  # Concourse CICD
  concourse_enabled = false
}