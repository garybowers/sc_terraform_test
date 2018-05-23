init:
	terraform init

plan: init
	terraform plan -var-file ../terraform.tfvars

apply: plan
	terraform apply -var-file ../terraform.tfvars -auto-approve 

destroy:
	terraform destroy -var-file ../terraform.tfvars -auto-approve 

test:
	cd tests
	dep ensure
	go test -v -run TestWebDeployment
