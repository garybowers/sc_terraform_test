## Thanks for taking the time to read through the test.

I will point out the layout of the repo.

The deployment is split into two areas:
* Runtime
* State
The main.tf is a container for the deployment and should contain config management for the deployment.
Resources are created with a "prefix" for the infrastructure name

All modules are stored in the ./tf_modules/aws/ folder

The runtime/main.tf and state.tf/main.tf contain the list of infrastructure we are going to deploy and source the modules in the tf_modules/aws folder providing a set of documented inputs and outputs.

This allows us to re-use code wherever possible and maintain standards.

Output of the terraform runs are in the _DOC/ folder, the errors were my free AWS account ran out of IP Addresses.

Tests are in the tests/ folder, however I ran out of time to do full coverage.

Also note: a bug in terraform hurt me [https://github.com/hashicorp/terraform/issues/12570](https://github.com/hashicorp/terraform/issues/12570) so i had to pass around strings... yuk! 

To run the tests execute the following:

```bash
cd tests
dep ensure
go test -v -run TestWebDeployment
```
