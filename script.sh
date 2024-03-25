#!/bin/bash

# AWS Credentials and Configurations
AWS_ACCESS_KEY="your_aws_access_key"
AWS_SECRET_KEY="your_aws_secret_key"
AWS_REGION="us-east-1"
SNS_TOPIC_ARN="arn:aws:sns:us-east-1:123456789012:ServerAlerts"

# Function to check CPU usage
check_cpu() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
    echo "CPU Usage: $cpu_usage"

    # Check if CPU usage exceeds threshold (e.g., 90%)
    if (( $(echo "$cpu_usage >= 90" | bc -l) )); then
        send_alert "High CPU Usage: $cpu_usage%"
    fi
}

# Function to check RAM usage
check_ram() {
    ram_usage=$(free -m | grep Mem | awk '{print $3}')
    echo "RAM Usage: $ram_usage MB"

    # Check if RAM usage exceeds threshold (e.g., 80%)
    if (( ram_usage >= 80 )); then
        send_alert "High RAM Usage: $ram_usage MB"
    fi
}

# Function to check disk space
check_disk() {
    disk_usage=$(df -h | grep '/dev/sda1' | awk '{print $5}')
    echo "Disk Usage: $disk_usage"

    # Check if disk usage exceeds threshold (e.g., 85%)
    if (( $(echo "$disk_usage >= 85" | bc -l) )); then
        send_alert "High Disk Usage: $disk_usage"
    fi
}

# Function to send alert via AWS SNS
send_alert() {
    message="$1"
    aws configure set aws_access_key_id "$AWS_ACCESS_KEY"
    aws configure set aws_secret_access_key "$AWS_SECRET_KEY"
    aws configure set default.region "$AWS_REGION"
    aws sns publish --topic-arn "$SNS_TOPIC_ARN" --message "$message" --subject "Server Alert"
    echo "Alert sent: $message"
}

# Main function to perform server monitoring
main() {
    echo "=== Server Monitoring ==="
    check_cpu
    check_ram
    check_disk
}

# Call main function
main
