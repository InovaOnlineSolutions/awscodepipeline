resource "aws_iam_role" "codebuildrole" {
  name = "codebuildrole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    },
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "states.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }        
  ]
}
EOF
}


# POLICY
resource "aws_iam_role_policy" "codebuild_policy" {
  name   = "codebuild_policy"
  role   = aws_iam_role.codebuildrole.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [

    {
      "Effect": "Allow",
      "Action": [
        "secretsmanager:*"
      ],
      "Resource": "*"
    },    
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": "*"
    },  
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:*"
      ],
      "Resource": "*"
    },    
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:*"
      ],
      "Resource": "*"
    },         
    {
			"Effect": "Allow",
			"Action": [
				"logs:CreateLogStream",
				"logs:PutLogEvents"
			],
			"Resource": "arn:aws:logs:${var.AWS_REGION}:${var.accountId}:*"
		},
    {
      "Effect": "Allow",
      "Action": "states:*",
      "Resource": "*"
    },
		{
			"Effect": "Allow",
			"Action": "logs:CreateLogGroup",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "kms:*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "iam:*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "lambda:*",
			"Resource": "*"
		}          
  ]
}
EOF
}

resource "aws_iam_role" "codepipelinerole" {
  name = "codepipelinerole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    },
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "states.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }        
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name   = "codepipeline_policy"
  role   = aws_iam_role.codepipelinerole.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "codestar-connections:*"
      ],
      "Resource": "*"
    },   
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": "*"
    },  
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:*",
        "codepipeline:*"
      ],
      "Resource": "*"
    },    
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:*"
      ],
      "Resource": "*"
    },         
    {
			"Effect": "Allow",
			"Action": [
				"logs:CreateLogStream",
				"logs:PutLogEvents"
			],
			"Resource": "arn:aws:logs:${var.AWS_REGION}:${var.accountId}:*"
		},
    {
      "Effect": "Allow",
      "Action": "states:*",
      "Resource": "*"
    },
		{
			"Effect": "Allow",
			"Action": "logs:CreateLogGroup",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "kms:*",
			"Resource": "*"
		}     
  ]
}
EOF
}


