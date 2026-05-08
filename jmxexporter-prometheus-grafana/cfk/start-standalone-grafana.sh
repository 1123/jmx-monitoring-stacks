#!/usr/bin/env bash

# Change to the script's directory
cd "$(dirname "$0")"

# Install Standalone Grafana
echo "Installing Standalone Grafana"
kubectl apply -f demo/grafana-standalone.yaml

# Wait for standalone grafana to be ready
echo "Waiting for standalone grafana to be ready"
kubectl rollout status deployment/grafana-standalone -n default --timeout=120s

# Kill existing port-forward if any
echo "Cleaning up existing port-forwarding"
pkill -f "port-forward svc/grafana-standalone" || true

# Forward ports
echo "Forwarding ports"
kubectl port-forward svc/grafana-standalone 3001:80 -n default > /dev/null 2>&1 &

echo "Login to standalone grafana at http://localhost:3001 (Anonymous Admin)"
echo "Done"
