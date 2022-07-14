variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "s3_bucket"          { default = "codebucket"}

variable "accountId" {default = "0000000"}

variable "sprint" {default = "1"}

variable "dockerhub_credentials" {type = string}

variable "codestar_connector_arn" {type = string}

variable "code_bucket" {type = string}