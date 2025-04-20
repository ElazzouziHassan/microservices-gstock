#!/bin/bash

start_service() {
  local folder=$1
  echo "Starting service in $folder..."
  (cd "$folder" && mvn spring-boot:run) &
}

start_service "products"
start_service "orders"
start_service "customers"
start_service "discovery-service"
start_service "admin-server"
start_service "config-server"

echo "All services are launched successfully."
