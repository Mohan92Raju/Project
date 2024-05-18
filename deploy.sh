#!/bin/bash

# Replace with your server details (IP, username)
SERVER_IP="ec2-54-169-153-1.ap-southeast-1.compute.amazonaws.com"
SERVER_USER="ec2-user"

scp -r docker-compose.yml $SERVER_USER@$SERVER_IP:/path/to/application/
ssh $SERVER_USER@$SERVER_IP "docker-compose up -d"
