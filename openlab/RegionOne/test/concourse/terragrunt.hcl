locals {
  # Automatically load account-level variables
  region_vars       = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars          = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  concourse_enabled = local.env_vars.locals.concourse_enabled
}

terraform {
  source = "git::https://gerrit.onap.org/r/integration/terraform//openlab/modules/cicd/concourse"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../kubernetes"]
}

inputs = {
  concourse_enabled = local.concourse_enabled

}
