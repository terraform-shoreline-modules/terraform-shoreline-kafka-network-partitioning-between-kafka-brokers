resource "shoreline_notebook" "network_partitioning_between_kafka_brokers" {
  name       = "network_partitioning_between_kafka_brokers"
  data       = file("${path.module}/data/network_partitioning_between_kafka_brokers.json")
  depends_on = [shoreline_action.invoke_network_checker]
}

resource "shoreline_file" "network_checker" {
  name             = "network_checker"
  input_file       = "${path.module}/data/network_checker.sh"
  md5              = filemd5("${path.module}/data/network_checker.sh")
  description      = "Check the network connectivity between Kafka brokers to identify any issues with the network configuration."
  destination_path = "/agent/scripts/network_checker.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_network_checker" {
  name        = "invoke_network_checker"
  description = "Check the network connectivity between Kafka brokers to identify any issues with the network configuration."
  command     = "`chmod +x /agent/scripts/network_checker.sh && /agent/scripts/network_checker.sh`"
  params      = ["BROKER_2_IP","BROKER_1_IP"]
  file_deps   = ["network_checker"]
  enabled     = true
  depends_on  = [shoreline_file.network_checker]
}

