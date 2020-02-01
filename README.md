# Magento 2.2/2.3 - Using Vagrant and Docker

This project is meant to be a tutorial for both starting a Magento 2.2 or 2.3 environment using a combination of Vagrant, VirtualBox, and Docker to provision a local working environment.  A write up of what each section does will be provided.  The purpose is to walk through each part of the provisioning scripts with a high level explanation of what each step does.  This not meant to be a best practices set of guidelines or an in depth tutorial on modern dev ops, but merely to provide an introduction to different concepts as well as a convenient way to kick start a local sandbox for users to quickly start to learn Magento and try out different things.

This should work with both Magento Open Source (CE) as well as Magento Commerce (EE) editions.  Prerequisites to start are the following:

- A computer with at least 4 cores and 8 GB of memory, but at least 8 cores and 16 GB of memory is recommended
- OS of Windows 10, Mac OSX 10.10 or higher, etc.  This may work on other operating systems such as Ubuntu, but no guarantees
- VirtualBox 6.0 or higher (note, this may work on VirtualBox 5.0 versions, but is not being tested on those versions)
- Vagrant 2.1 or higher (again, this may work on earlier versions, but is not being tested against those versions)
- For Windows machines, a user will want some type of Linux style bash shell, such as Git bash, for example (https://gitforwindows.org/).
- A set of authentication keys from Magento - more details for acquiring are available at the following link - https://devdocs.magento.com/guides/v2.3/install-gde/prereq/connect-auth.html.  Please note, that this is required for both Open Source and Commerce Editions when installing via composer (at this project does).  Anyone can register for keys that provide access to Open Source, but you will need special permission for Commerce Edition granted via an existing organization.  Please follow up with your organization or client for more details on access to Commerce Edition.

<B>Please note:</B>  The latest version of VirtualBox may not always work with the latest version Vagrant, since Vagrant has special settings for each particular version of VirtualBox. However, it is still possible to get both working - for example, to get Vagrant 2.2.6 to work with VirtualBox 6.1, you can follow the steps on the following link:  https://github.com/oracle/vagrant-boxes/issues/178.

Docs for this project are located in the docs directory, and can be viewed online here:   https://leodolan.github.io/magento2_vagrant_docker/
