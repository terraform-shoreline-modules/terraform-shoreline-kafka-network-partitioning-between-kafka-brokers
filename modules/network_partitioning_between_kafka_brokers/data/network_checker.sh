

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