#!/bin/sh
set -e

echo "[init] Creando recursos en LocalStack..."
# S3
awslocal s3 mb s3://demo-bucket
# SQS
awslocal sqs create-queue --queue-name demo-queue
# DynamoDB (tabla simple)
awslocal dynamodb create-table \
  --table-name DemoTable \
  --attribute-definitions AttributeName=pk,AttributeType=S \
  --key-schema AttributeName=pk,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST

echo "[init] Listo."