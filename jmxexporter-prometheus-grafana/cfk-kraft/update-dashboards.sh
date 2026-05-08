#!/bin/bash
OUTPUT_DIR=dashboards
mkdir -p $OUTPUT_DIR

# Base replacements
COMMON_SED='s/\${Prometheus}//g;s/Environment/Namespace/g;s/env/namespace/g;s/Instance/Pod/g;s/instance/pod/g'

# KRaft specific dashboards
sed "$COMMON_SED;s/label_values(namespace)/label_values(kafka_server_raft_metrics_current_state, namespace)/g;s/kafka-broker/kafka/g" ../assets/grafana/provisioning/dashboards/kraft.json > $OUTPUT_DIR/kraft.json
sed "$COMMON_SED;s/label_values(namespace)/label_values(kafka_server_raft_metrics_current_state, namespace)/g;s/kafka-broker/kafka/g" ../assets/grafana/provisioning/dashboards/confluent-platform-kraft.json > $OUTPUT_DIR/confluent-platform-kraft.json
sed "$COMMON_SED;s/label_values(namespace)/label_values(kafka_server_raft_metrics_current_state, namespace)/g;s/kafka-broker/kafka/g" ../assets/grafana/provisioning/dashboards/kafka-cluster-kraft.json > $OUTPUT_DIR/kafka-cluster.json
sed "$COMMON_SED;s/label_values(namespace)/label_values(kafka_log_log_size, namespace)/g;s/kafka-broker/kafka/g" ../assets/grafana/provisioning/dashboards/kafka-topics-kraft.json > $OUTPUT_DIR/kafka-topics.json
