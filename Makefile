init:
	terraform init

plan: init
	terraform plan

apply: plan
	terraform apply

destroy:

test:
