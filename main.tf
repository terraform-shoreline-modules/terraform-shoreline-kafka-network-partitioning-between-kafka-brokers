terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "network_partitioning_between_kafka_brokers" {
  source    = "./modules/network_partitioning_between_kafka_brokers"

  providers = {
    shoreline = shoreline
  }
}