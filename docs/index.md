## Welcome to development on Magento 2.2/2.3

Welcome to this guide for starting development on Magneto 2.2/2.3 locally using Vagrant, VirtualBox, and Docker.  Before you start, make sure you have met all the prerequisites listed here: https://github.com/leodolan/magento2_vagrant_docker/blob/master/README.md.

From a high level perspective, this project uses Vagrant and Virtualbox to initially provision a VM running Ubuntu 18.04 (Bionic Beaver), and from there all provisioning of docker and contaiers is done inside the VM running Ubuntu.  While this adds some additional overhead, it simplifies the setup of the environment across different machines and operating systems to Vagrant & Virtualbox.
 
The first part of the tutorial will walk a user through launching the environment, and a high-level overview of what different parts of the provisioning scripts perform.

The next part of the tutorial will walk a user through setting up a development IDE (PHPStorm or Netbeans), and through some basic starting excercises.

### Getting Started

Aside for the prerequisites listed in the readme.md, there are two steps that must be done prior to gettings started:

1.  Copy auth.json.example in the /scripts/docker/config directory and rename as "auth.json" (within the same directory).  Edit the document, and replace the sections [PUBLICKEY] and [PRIVATEKEY] with actual keys from your account in Magento portal (or provided to you by your employer or client).  For more information, visit https://devdocs.magento.com/guides/v2.3/install-gde/prereq/connect-auth.html.
2.  Create a hostfile entry for "mag.demo" pointed to the IP defined in the "Vagrantfile" under MAGENTO_PRIVATE_IP (e.g. 192.168.56.160).  For Windows machines, edit your host file at C:\Windows\System32\drivers\etc\hosts.  For Mac/Linux, at /etc/hosts.  This will require administrative privleages.  Please note, if you don't have the rights to change hosts files on your machine, but can install browser plugins, you could try the following plug-in for Chrome - https://chrome.google.com/webstore/detail/livehosts/hdpoplemgeaioijkmoebnnjcilfjnjdi?hl=en.

### Part 1

1.  Overview of [Vagrant](vagrant) and starting/stopping VM
2.  Overview of Docker
3.  Overview of MySQL
4.  Overview of Redis
5.  Overview of Mailhog
6.  Overview of Composer
6.  Overview of Magento

### Part 2

1.  Starting Development with PHPStorm
2.  Starting Development with Netbeans
3.  Creating an initial module 
4.  Installing a schema
5.  Populating inital data
6.  Creating a front end
7.  Creating backend screen for management of data via admin
