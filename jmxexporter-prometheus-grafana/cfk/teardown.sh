#!/usr/bin/env bash

# Kill port-forwarding processes
echo "Stopping port-forwarding"
pkill -f "port-forward"

# Teardown local k8s cluster with kind
kind delete cluster
rm -fr dashboards