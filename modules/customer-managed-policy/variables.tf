variable "pgp_key" {
  description = "The pgp_key that is passed to the aws_iam_user_login_profile resource. Refer to https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile#pgp_key for more details."
  default     = "keybase:mbigras"
}

variable "test_user_name" {
  description = "The name of the test user that is created by following the https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_managed-policies.html AWS tutorial."
  default     = "alice"
}
