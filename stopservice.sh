#!/bin/bash

# Loop over all arguments
for port in "$@"
do
    echo "Stopping services on port $port"

    # Find the PID of the service running on the port
    pid=$(lsof -t -i:$port)
    echo "PID: $pid"
    # If a service is running on the port, stop it
    if [ -n "$pid" ]; then
        kill -9 $pid
        echo "Stopped service on port $port"
    else
        echo "No service running on port $port"
    fi
done