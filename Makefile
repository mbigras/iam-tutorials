init:
	terraform init

plan:
	terraform fmt && terraform plan -out current.plan

plan-to-destroy:
	terraform fmt && terraform plan -out current.plan -destroy

apply:
	terraform apply current.plan

list-users:
	aws iam list-users --query 'Users[].[UserName]' --output text

list-policies:
	aws iam list-policies --query 'Policies[].[PolicyName]' --output text | grep UsersReadOnlyAccessToIAMConsole

copy-password:
	# https://github.com/hashicorp/terraform/issues/27213
	terraform output -json password | jq -r . | base64 --decode | keybase pgp decrypt | pbcopy
