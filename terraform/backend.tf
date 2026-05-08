terraform {
  backend "s3" {
    bucket        = "eksargoterrabackend"
    key           = "assignment/terraform.tfstate"
    region        = "us-west-2"
    encrypt       = true
    use_lockfile  = true
  }
}