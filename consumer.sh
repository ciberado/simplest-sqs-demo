#!/bin/sh

name=demo
echo Using queue $name
qurl=$(aws sqs get-queue-url --queue-name $name --query QueueUrl --output text)
echo Queue url: $qurl
while true; do
    msg=$(aws sqs receive-message \
	     --queue-url $qurl \
	     --max-number-of-message 1 \
	     --region=eu-west-1)
    handler=$(echo "$msg" | jq -r .Messages[0].ReceiptHandle)
    body=$(echo "$msg" | jq -r .Messages[0].Body)
    echo "$body"
    aws sqs delete-message --queue-url $qurl --receipt-handle $handler
 
    sleep 2
done
