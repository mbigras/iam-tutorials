# IAM tutorial: Create and attach your first customer managed policy
# https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_managed-policies.html
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_iam_user" "test_user" {
  name = var.test_user_name
}

resource "aws_iam_user_login_profile" "test_user" {
  user                    = aws_iam_user.test_user.name
  pgp_key                 = var.pgp_key
  password_reset_required = false
}

data "aws_iam_policy_document" "ro_policy" {
  statement {
    actions = [
      "iam:GenerateCredentialReport",
      "iam:Get*",
      "iam:List*",
    ]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ro_policy" {
  name   = "UsersReadOnlyAccessToIAMConsole"
  path   = "/"
  policy = data.aws_iam_policy_document.ro_policy.json
}

resource "aws_iam_policy_attachment" "policy_attachment" {
  name       = "test-user-attachment"
  users      = [aws_iam_user.test_user.name]
  policy_arn = aws_iam_policy.ro_policy.arn
}
