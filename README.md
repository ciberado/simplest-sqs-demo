# Simplest SQS demo

This demo shows a basic Amazon SQS workflow: create a queue, send messages to
it, receive and delete messages, and then delete the queue.

## Prerequisites

- AWS CLI installed and configured with credentials that can manage SQS queues
  and messages.
- `jq` and `seq` available in your shell. The consumer uses `jq` to read
  messages.

The scripts use the queue name `demo` and AWS region `eu-west-1`. Set the
default region for AWS CLI commands that do not specify one:

```sh
export AWS_DEFAULT_REGION=eu-west-1
```

## Run the demo

1. Create the queue:

   ```sh
   ./init.sh
   ```

2. In one terminal, start the consumer. It continuously receives and deletes
   messages; stop it with Ctrl-C when finished.

   ```sh
   ./consumer.sh
   ```

3. In another terminal, start the producer. It sends 1,000 messages, one per
   second, then exits.

   ```sh
   ./producer.sh
   ```

4. Stop the consumer, then delete the queue:

   ```sh
   ./destroy.sh
   ```

`destroy.sh` deletes the `demo` queue and any messages still in it.
