locals {
  # Automatically load account-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  keycloak_enabled = local.env_vars.locals.keycloak_enabled
  kubernetes_home  = local.env_vars.locals.kubernetes_home
  olm_version      = local.env_vars.locals.olm_version
}

terraform {
  source = "git::https://gerrit.onap.org/r/integration/terraform//openlab/modules/kubernetes/keycloak"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../kubernetes"]
}


inputs = {
  keycloak_enabled = local.keycloak_enabled
  kubernetes_home  = local.kubernetes_home
  olm_version      = local.olm_version
  crds_yaml        = "https://github.com/operator-framework/operator-lifecycle-manager/releases/download/${local.olm_version}/crds.yaml"
  olm_yaml         = "https://github.com/operator-framework/operator-lifecycle-manager/releases/download/${local.olm_version}/olm.yaml"
}
