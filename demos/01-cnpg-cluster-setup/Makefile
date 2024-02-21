.PHONY: install-operator
install-operator:
	helm upgrade --install cnpg \
		--namespace cnpg-system \
		--create-namespace \
		cnpg/cloudnative-pg \
		--set fullnameOverride=cnpg-postgres-operator \
		--set replicaCount=2 \
		--set monitoring.grafanaDashboard.create=true \
		--set monitoring.grafanaDashboard.sidecarLabel=grafana_dashboard \
		--set-string monitoring.grafanaDashboard.sidecarLabelValue="1"
