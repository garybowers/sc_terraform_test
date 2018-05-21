package test

import (
	"fmt"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)


func TestWebDeployment(t *testing.T) { 
	(t *testing.T) {

	instanceName := fmt.Sprintf("test1-web-vm")

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",

	}

	terraform.InitAndApply(t, terraformOptions)

	// yuk hardcoded url 
	instanceURL := "http://test1-lb-702559999.eu-west-1.elb.amazonaws.com"
	
	instanceText := fmt.Sprintf("Hello, %s!", "World")	

	// Wait for instance to come up
	maxRetries := 15
	timeBetweenRetries := 5 * time.Second

	// Verify that we get back a 200 OK with the expected instanceText
	http_helper.HttpGetWithRetry(t, instanceURL, 200, instanceText, maxRetries, timeBetweenRetries)
}
