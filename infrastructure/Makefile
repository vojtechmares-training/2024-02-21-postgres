.PHONY: apply
apply:
	terraform apply -auto-approve

.PHONY: destroy
destroy:
	terraform state list | grep helm_release | xargs terraform state rm
	terraform state list | grep kubectl_manifest | xargs terraform state rm
	terraform destroy -auto-approve
