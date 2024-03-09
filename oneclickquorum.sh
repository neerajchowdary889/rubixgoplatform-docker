#!/bin/bash
logfile="/linux1/rubix.log"
rubix_dir="/linux1" 

# Function to add a timestamp to the logfile
add_timestamp() {
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

add_timestamp "Starting sessions" >> $logfile

base_port=20000
base_grpc_port=10500

# Change directory to rubixgoplatform directory
cd "$rubix_dir" || exit 1  # Exit the script if cd fails

#Primary Node in Port 20000/10500
# screen -dmS node0 ./rubixgoplatform run -p node0 -n 0 -s -port $base_port -testNet -grpcPort $base_grpc_port
# echo "Starting for node0 on $base_port"

# #wait 30sec for primary node to start
# echo "Will wait for 30s to start the primary node"
# sleep 30

#Validator Nodes
for ((i=0; i<=9; i++)); do
  port=$((base_port + i))
  grpc_port=$((base_grpc_port + i))
  echo "Starting for node$i on $port"
  screen -dmS "node$i" ./rubixgoplatform run -p "node$i" -n "$i" -s -port "$port" -testNet -grpcPort "$grpc_port"
  add_timestamp "Started session for node$i, port: $port, grpcPort: $grpc_port" >> $logfile
  sleep 10
done

add_timestamp "All sessions started" >> $logfile
