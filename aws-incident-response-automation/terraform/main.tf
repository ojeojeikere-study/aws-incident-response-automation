terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "aws-incident-response-automation/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region     = var.region
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_key = "YOUR_AWS_SECRET_KEY"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-auto-remediation-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = @{ Service = "lambda.amazonaws.com" },
      Effect = "Allow"
    }]
  })
}

resource "aws_lambda_function" "auto_remediation" {
  function_name = "auto-remediation"
  handler       = "auto_remediation.lambda_handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  filename      = "../lambda/auto_remediation.zip"
}

resource "aws_sns_topic" "alerts" { name = "incident-alerts" }

resource "aws_cloudwatch_metric_alarm" "ec2_cpu_alarm" {
  alarm_name          = "HighEC2CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_actions       = [aws_sns_topic.alerts.arn]
  dimensions          = @{ InstanceId = "i-xxxxxxxxxxxx" }
}
