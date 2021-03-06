NET = "192.168.132"
DOMAIN = ".vntechsol.com"


Vagrant.configure("2") do |config|
  
  vm = 2
  (1..vm).each do |machine_id|
    config.vm.define "mq-node#{machine_id}" do |machine|
      machine.vm.hostname = "mq-node#{machine_id}" + DOMAIN
      machine.vm.box = "centos/7"
      machine.vm.network "forwarded_port", guest: 22, host: "228#{machine_id}"
      machine.ssh.insert_key = false
      machine.ssh.port = "228#{machine_id}"
      machine.vm.network "private_network", ip: NET + ".2#{machine_id}"
      machine.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=755", "fmode=644"]
      machine.vm.boot_timeout = 60

      machine.vm.provider "virtualbox" do |vm|
        vm.cpus = 1
        vm.memory = 2048
        vm.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      end

      if machine_id == vm
        machine.vm.provision "ansible_local" do |ansible|
          ansible.limit = "all"
          ansible.verbose = true
          ansible.become = true
          ansible.raw_arguments = ["-v"]
          ansible.playbook = "site.yml"
          ansible.tags = ["rabbitmq_cluster"]
          ansible.inventory_path = "inventory.ini"
          ansible.extra_vars = {
            ansible_ssh_users: 'vagrant'
          }
          ansible.groups = {
            "rabbitmq_master" => ["mq-node1"],
            "rabbitmq_node1" => ["mq-node2"]
          }
        end
      end
    end
  end
end
