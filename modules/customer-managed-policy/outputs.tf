output "console_url" {
  value = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
}

output "username" {
  value = aws_iam_user.test_user.name
}

output "password" {
  value = aws_iam_user_login_profile.test_user.encrypted_password
}
