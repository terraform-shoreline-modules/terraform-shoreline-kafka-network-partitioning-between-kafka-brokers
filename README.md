
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Network Partitioning Between Kafka Brokers.
---

This incident type refers to a situation where there is an issue with the communication between Kafka brokers due to network partitioning. A network partition is a situation where a network is split into two or more parts, and communication between them is disrupted. This issue can lead to data inconsistency, loss of messages, delayed message delivery, and other related problems. As a result, it is important to quickly detect and resolve these incidents to prevent any downstream impact on the system.

### Parameters
```shell
export KAFKA_BROKER_IP="PLACEHOLDER"

export BROKER_1_IP="PLACEHOLDER"

export BROKER_2_IP="PLACEHOLDER"
```

## Debug

### Check the status of Kafka brokers
```shell
systemctl status kafka
```

### Check the logs of Kafka brokers for any errors related to network partitioning
```shell
journalctl -u kafka | grep "network partitioning"
```

### Check the network configuration of Kafka brokers
```shell
ifconfig
```

### Check the network routing tables of Kafka brokers
```shell
route -n
```

### Verify the network connectivity between Kafka brokers
```shell
ping ${KAFKA_BROKER_IP}
```

### Check the firewall settings to ensure that the necessary ports are open for Kafka communication
```shell
iptables -L
```

### Check the disk usage of Kafka brokers to ensure that there is enough space for message storage
```shell
df -h
```

## Repair

### Check the network connectivity between Kafka brokers to identify any issues with the network configuration.
```shell


#!/bin/bash



# Define the Kafka brokers to check

BROKER_1=${BROKER_1_IP}

BROKER_2=${BROKER_2_IP}



# Ping the first broker

ping -c 3 $BROKER_1



# Check the exit status of the ping command

if [ $? -eq 0 ]; then

  echo "The network connection to $BROKER_1 is working."

else

  echo "The network connection to $BROKER_1 is not working."

fi



# Ping the second broker

ping -c 3 $BROKER_2



# Check the exit status of the ping command

if [ $? -eq 0 ]; then

  echo "The network connection to $BROKER_2 is working."

else

  echo "The network connection to $BROKER_2 is not working."

fi


```