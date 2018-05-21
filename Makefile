init:
	terraform init

plan: init
	terraform plan -var-file ../terraform.tfvars

apply: plan
	terraform apply -var-file ../terraform.tfvars

destroy:
	terraform destroy -var-file ../terraform.tfvars

test:
