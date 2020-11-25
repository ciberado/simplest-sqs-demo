#!/bin/sh

qurl=$(aws sqs get-queue-url --queue-name demo --query QueueUrl --output text --region eu-west-1)
aws sqs delete-queue --queue-url $qurl
