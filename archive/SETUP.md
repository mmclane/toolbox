# Setup steps

## Environment Variables

The following environment variables need to be set prior to provisioning a VM.  These are used to customize your environment and get software in the toolbox configured correctly

* KNPEM_PATH
  * i.e. $env:KNPEM_PATH='C:\Users\matt.mclane\.chef\mmclane.pem"
  * This environment variable is the path to your chef knife pem file.  This is copied into the toolbox to /home/vagrant/.chef/knife.pem.
  * If you previously had knife configured on your system then this file is probably in ~/.chef.  It is referenced in your knife.rb file as client_key.  This pem file was created when your account was configured on the chef server
  * If this is not specified, then knife will not be configured correctly until you put the knife.pem file in place manually.
* PACKER_SSH_KEY_PATH [OPTIONAL]
  * i.e. $env:PACKER_SSH_KEY_PATH='C:\keys\matt.mclane.pem'
  * This environment variable allows you to set a custom path to your packer ssh key.  This is the pem file connected with your key pair used when running packer.  This file will get copied into the toolbox to /home/vagrant/.aws/knife.pem.
  * If you already have a pem file in your .aws directory, then you don't need to configure this environment variable.

## Local Credentials

### SSH

Insure your personal ~/.ssh/id_rsa is in place.  This likely is what is used by git among other things.

### AWS

Your AWS credentials need to be setup on your local machine just as they would if you configure the AWS CLI locally.  That is to say the files need to be located in ~/.aws.  In that directory there should be 3 files.

* ~/.aws/config and ~/.aws/credentials
  * <https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html>

* ~/.aws/packer_key.pem
  * PEM file linked to your packer key pair named in customizations.sh
  * This is optional, and can be named differently.  Just make sure to specify the name in customizations.sh.  If you chose to store this in a different location, make sure you include the PACKER_SSH_KEY_PATH environment variable.

### Chef

You will need to have your PEM file associated with your chef admin account on your system.  The path to it should be stored in the KNPEM_PATH environment variable.

## Required Software

* VirutalBox
  * Go to the VirtualBox download page (<https://www.virtualbox.org/wiki/Downloads>), choose your operating system (Windows or macOS) and download and install the software.
  * Configure it to run correctly on your machine.
* Vagrant
  * Go to the Vagrant download page (<https://www.vagrantup.com/downloads.html>), choose your operating system (Windows or macOS) and download and install the software.
* Git
  * You will likely need git installed and configured to work with github.llamasoft.com

## Customizations

* Setup customizations
  * Copy customizations.template and rename to customizations.sh
  * Edit contents to include your information as needed.
* In toolbox repo directory, create a folder named synced.  See README.md for usage