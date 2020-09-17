#!/usr/bin/env bash
#

echo "Enable RabbitMQ management console"
/usr/sbin/rabbitmq-plugins enable rabbitmq_management
echo
echo "Change the ownership and file permission"
chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/
echo
echo "Add RabbitMQ admin user"
/usr/sbin/rabbitmqctl add_user mqadmin mqadminpassword
echo
echo "Set RabbitMQ admin user tag name"
/usr/sbin/rabbitmqctl set_user_tags mqadmin administrator
echo
echo "Set RabbitMQ permission"
/usr/sbin/rabbitmqctl set_permissions -p / mqadmin ".*" ".*" ".*"
echo
echo "Enable RabbitMQ management console successful and ready to logon via mqadmin user"