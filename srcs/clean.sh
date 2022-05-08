#!/bin/sh

kubectl delete --all pods
kubectl delete --all deployments
kubectl delete --all services
kubectl delete --all pvc
