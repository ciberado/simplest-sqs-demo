#!/bin/sh
 
name=demo
echo Using queue $name
qurl=`aws sqs get-queue-url --queue-name $name --query QueueUrl --output text`
echo Qeueu url: $qurl
for i in `seq 1 1000`; do
  aws sqs send-message \
	  --queue-url $qurl \
	  --message-body "This is message $i." \
	  --region=eu-west-1
  sleep 1
done
