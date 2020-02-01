VAGRANTFILE_API_VERSION = "2"

#variables for use in provisioning scripts - these are passed into the s.env variables, and become 
#shell variables for the subsequent provisioning and docker setup scripts (docker-compose.yml, etc.) - 
#only available on initial vagrant up provisioning

#VM settings - check for other projects to avoid IP collisions
MAGENTO_PRIVATE_IP = "192.168.56.160"
MAGENTO_VM_CPUS = 4
MAGENTO_VM_MEM = 8192

#version of DB to install
MYSQL_VER = "mariadb:10.2"

#version of ElasticSearch
ES_VER = "docker.elastic.co/elasticsearch/elasticsearch:6.8.5"

#uncomment for 2.2.11 version of Magento
#MAG_PROJECT = "project-enterprise-edition:2.2.11"
#MAG_VER = "2_2"

#uncomment for 2.3.3 version of Magento
MAG_PROJECT = "project-enterprise-edition:2.3.4"
MAG_VER = "2_3"

#settings for primary DB
MAG_DB_NAME = "magento2"
MAG_UNAME = "magento2"
MAG_PWD = "magento2"

#settings for admin
MAG_ADMIN_URL = "admin_demo"
MAG_ADMIN_NAME = "admin"
MAG_ADMIN_PWD = "DEMO2020"

#other magento settings
MAG_FRONT_URL = "mag.demo"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.define :magento do |config|

		config.vm.box = "ubuntu/bionic64"

		# change memory size
		config.vm.provider "virtualbox" do |v|
		  v.memory = MAGENTO_VM_MEM
		  v.cpus = MAGENTO_VM_CPUS
		  v.gui = false
		end
  
		#Set reserved IP
		config.vm.network "private_network", ip: MAGENTO_PRIVATE_IP

		# provision
		config.vm.provision "shell" do |s|
		s.path = "scripts/provision.sh"
		s.env = {
		"MAGENTO_PRIVATE_IP" => MAGENTO_PRIVATE_IP, 
		"MYSQL_VER" => MYSQL_VER, 
		"ES_VER" => ES_VER, 
		"MAG_VER" => MAG_VER, "MAG_PROJECT" => MAG_PROJECT,
		"MAG_DB_NAME" => MAG_DB_NAME,
		"MAG_UNAME" => MAG_UNAME,
		"MAG_PWD" => MAG_PWD,
		"MAG_ADMIN_URL" => MAG_ADMIN_URL,
		"MAG_ADMIN_NAME" => MAG_ADMIN_NAME,
		"MAG_ADMIN_PWD" => MAG_ADMIN_PWD,
		"MAG_FRONT_URL" => MAG_FRONT_URL
		}
		s.args = ENV['PROVISION_ARGS']
		end
		config.vm.synced_folder '.', '/vagrant' 
	end
end
