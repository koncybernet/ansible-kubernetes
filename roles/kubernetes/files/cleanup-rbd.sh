#!/bin/sh

function releaseRBD()
{
	LOCKER=$(rbd lock list $1 -p infra --format json | jq -r ' ..? | .locker | select(type!="null")')
	ID=$(rbd lock list $1 -p infra --format json | jq -r ' . | to_entries[] | .key')
	rbd lock remove -p infra $1 $ID $LOCKER
}

releaseRBD "grafana-data"
releaseRBD "grafana-config"
releaseRBD "influxdb-config"
releaseRBD "influxdb-data"

