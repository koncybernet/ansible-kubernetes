#!/bin/sh
kubectl delete namespace llama2-infra
kubectl delete pv grafana-config grafana-data influxdb-config influxdb-data

