# Automated-Server-Monitoring-and-Alerting-with-Bash-Script-and-AWS-SNS
Created a Bash script to automate server monitoring tasks on Ubuntu, utilizing AWS SNS for real-time alerts when critical thresholds are reached.

**Key Features:**

1. Monitors CPU usage, RAM usage, and disk space on the Ubuntu server.
2. Utilizes AWS CLI commands to send alerts via AWS SNS.
3. Configurable thresholds for CPU, RAM, and disk usage alerts.
4. Sends real-time alerts to an AWS SNS topic for monitoring and notification.

**Benefits:**

- Automated server monitoring reduces manual effort and ensures timely detection of resource utilization issues.
- Integration with AWS SNS enables centralized alerting and notification management.
- Customizable thresholds and alert messages for specific monitoring requirements.
- Facilitates proactive monitoring and response to potential server performance issues.

**Technologies Used:**

- Ubuntu Linux
- Bash scripting
- AWS CLI (SNS)

**Note:** Make sure to replace placeholders (e.g., `your_aws_access_key`, `your_aws_secret_key`, `arn:aws:sns:us-east-1:123456789012:ServerAlerts`) with your actual AWS credentials and SNS topic ARN before running the script. Also, ensure that the AWS CLI is installed and configured on the Ubuntu server.
