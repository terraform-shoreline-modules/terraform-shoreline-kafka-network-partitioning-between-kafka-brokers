resource "shoreline_notebook" "network_partitioning_between_kafka_brokers" {
  name       = "network_partitioning_between_kafka_brokers"
  data       = file("${path.module}/data/network_partitioning_between_kafka_brokers.json")
  depends_on = [shoreline_action.invoke_network_check]
}

resource "shoreline_file" "network_check" {
  name             = "network_check"
  input_file       = "${path.module}/data/network_check.sh"
  md5              = filemd5("${path.module}/data/network_check.sh")
  description      = "Check the network connectivity between Kafka brokers to identify any issues with the network configuration."
  destination_path = "/agent/scripts/network_check.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_network_check" {
  name        = "invoke_network_check"
  description = "Check the network connectivity between Kafka brokers to identify any issues with the network configuration."
  command     = "`chmod +x /agent/scripts/network_check.sh && /agent/scripts/network_check.sh`"
  params      = ["BROKER_2_IP","BROKER_1_IP"]
  file_deps   = ["network_check"]
  enabled     = true
  depends_on  = [shoreline_file.network_check]
}

