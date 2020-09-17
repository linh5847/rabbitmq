#!/usr/bin/env bash

echo "Create high availability policy"
rabbitmqctl set_policy -p "/" --priority 1 --apply-to "all" ha ".*" '{ "ha-mode": "exactly", "ha-params": 2, "ha-sync-mode": "automatic"}'
echo
echo "Create client policy"
rabbitmqctl set_policy -p "/" --priority 1 --apply-to "queues" ha-client "client.*" '{ "ha-mode": "nodes", "ha-params": ["rabbit@master", "rabbit@client-ha"], "ha-sync-mode": "automatic"}
echo
echo "Create product policy"
rabbitmqctl set_policy -p "/" --priority 1 --apply-to "queues" ha-product "product.*" '{ "ha-mode": "nodes", "ha-params": ["rabbit@master", "rabbit@product-ha"], "ha-sync-mode": "automatic"}
echo
echo "RabbitMQ policy applying successful!!!"