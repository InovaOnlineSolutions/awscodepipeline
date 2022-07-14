
resource "aws_codepipeline" "codepipeline" {
  name     = "tf-test-pipeline"
  role_arn = aws_iam_role.codepipelinerole.arn

  artifact_store {
    location = var.code_bucket
    type     = "S3"

  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["tf-code"]

      configuration = {
        ConnectionArn        = var.codestar_connector_arn
        FullRepositoryId     = "<your repo>"
        BranchName           = "main"
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts = ["tf-code"]

      configuration = {
        ProjectName = "tf_apply"
      }
    }
  }


}
