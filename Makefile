include .env
export $(shell sed 's/=.*//' .env)

.DEFAULT_GOAL := help
.PHONY: help

help:
	@echo "Target list" && \
	grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed 's/Makefile://g' \
	| sed 's/^\(.*\): \(.*\)## \(.*\)/\t\1\n\t\tdepend on: \2\n\t\tdescription: \3/g'
init:
	terraform init
validate: init ## validate
	terraform validate
plan: validate ## plan
	terraform plan -var do_token=$(DO_PAT_TERRAFORM) -out=tfplanexit
apply: plan ## apply to 
	terraform apply -auto-approve tfplanexit
destroy:
	terraform destroy -var "do_token=$(DO_PAT_TERRAFORM)" -auto-approve