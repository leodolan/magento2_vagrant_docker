## Overview of Vagrant

Vagrant is an open source command line utility for building VMs, originally with VirtualBox but later extended to VMWare, KVM, and Amazon EC2.  As of version 1.6, Vagrant also supports Docker containers.  More information about Vagrant is available here: (https://www.vagrantup.com/intro/getting-started/index.html)

When using Vagrant, the most important file for defining and starting a VM is the Vagrantfile.  Additionally, vagrant provisioning will start with and initial "box", which is typically a light weight base image that will have the basic OS configs saved to them.

You can create a templated Vagrantfile based on a vagrant box by running the following command:

```markdown
vagrant init hashicorp/bionic64
```

Running this command would produce a file that, when removing commenting, would look as such:

```markdown
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
end
```

