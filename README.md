RabbitMQ Installation Document link

https://www.rabbitmq.com/install-rpm.html#install-erlang

Firewall Ports:-

4369 = epmd

5672, 5671 = AMQP

25672 = inter-node and CLI tools communication 

35672-35682 = used by CLI tools (Erlang distribution client ports) for communication with nodes 

15672 = HTTP API clients, management UI and rabbitmqadmin (only if the management plugin is enabled)

61613, 61614 =  STOMP clients without and with TLS (only if the STOMP plugin is enabled)

1883, 8883 = (MQTT clients without and with TLS, if the MQTT plugin is enabled

15674 = STOMP-over-WebSockets clients (only if the Web STOMP plugin is enabled)

15675 = MQTT-over-WebSockets clients (only if the Web MQTT plugin is enabled)

15692 = Prometheus metrics (only if the Prometheus plugin is enabled)

The Ansible playbook has had been developed and tested using vagrant.

This can be clone from GitHub "linh5847" link.

git clone git@github.com:linh5847/rabbitmq.git

cd rabbitmq

vagrant status

vagrant up