resource "aws_codebuild_project" "tf_apply" {
  name         = "tf_apply"
  description  = "test_codebuild_project"
  service_role = aws_iam_role.codebuildrole.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:1.2.2"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"

    registry_credential {
      credential          = var.dockerhub_credentials
      credential_provider = "SECRETS_MANAGER"
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec/apply-buildspec.yml")
  }

}