echo "workin"
cd /tmp

KUBE_VERSION="v1.18.0"
TERRAFORM_VERSION="1.0.4"
# TERRAGRUNT_VERSION="v0.25.2"
# PACKER_VERSION="1.6.0"
# CHEFDK_VERSION="2.4.17"
HUB_VERSION="2.14.2"
K9S_VERSION="v0.24.7"

# sudo apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
sudo apt-get install -y build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip curl wget

echo "### VirtualBox Guest Additions"
sudo apt-get install -ydddddddddddd dkms linux-headers-$(uname -r)
VBOX_VERSION=$(cat /tmp/.vbox_version)
sudo mount -o loop /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /mnt

echo "### Scripts"
sudo mkdir /scripts
sudo mv /tmp/scripts/* /scripts
sudo chmod a+x /scripts/*

echo "### Install JQ"
sudo apt-get install -y jq

echo "### Python"
sudo apt-get install -y dos2unix libffi-dev libssl-dev openssl python3-pip
sudo ln -s /usr/bin/python3 /usr/local/bin/python
sudo ln -s /usr/bin/python3 /usr/local/bin/python3
sudo ln -s /usr/bin/pip3 /usr/bin/pip
pip install --upgrade pip

pip install pre-commit

# echo "### Powershell"
# sudo apt-get install -y epel-release
# sudo apt-get install -y krb5-workstation
# wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb > /dev/null 2>&1
# sudo dpkg -i packages-microsoft-prod.deb
# wget http://mirrors.kernel.org/ubuntu/pool/main/i/icu/libicu55_55.1-7ubuntu0.5_amd64.deb > /dev/null 2>&1
# sudo dpkg -i libicu55*.deb
# sudo apt update
# sudo apt-get install -y powershell

#echo "### Go"
#sudo apt-get install -y golang-go

#echo "### Ruby"
#sudo apt-get install -y ruby

echo "### AWS_CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "### Helm"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > /dev/null 2>&1
chmod 700 get_helm.sh
./get_helm.sh
which helm

echo "### Kubernetes"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" > /dev/null 2>&1
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
which kubectl 

# echo "### Ansible"
# sudo apt-add-repository ppa:ansible/ansible
# sudo apt update
# sudo apt install ansible

# echo "### Azure CLI"
# echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ bionic main" | tee /etc/apt/sources.list.d/azure-cli.list
# curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
# sudo apt-get install apt-transport-https
# sudo apt-get update && apt-get install azure-cli

echo "### Installing Hub"  # https://github.com/github/hub
wget https://github.com/github/hub/releases/download/v2.14.2/hub-linux-amd64-${HUB_VERSION}.tgz > /dev/null 2>&1
tar zxvf hub-linux-amd64-${HUB_VERSION}.tgz > /dev/null 2>&1
cd hub-linux-amd64-${HUB_VERSION}
sudo ./install
cd /tmp
which hub

echo '### Installing jfrog cli'
wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | sudo apt-key add -;
echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" | sudo tee -a /etc/apt/sources.list;
sudo apt update
sudo apt install -y jfrog-cli

echo "### Installing K9S"
wget https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_x86_64.tar.gz > /dev/null 2>&1
tar zxvf k9s_Linux_x86_64.tar.gz > /dev/null 2>&1
sudo mv k9s /usr/local/bin
which k9s

echo "### Rancher system-tools"
wget https://github.com/rancher/system-tools/releases/download/v0.1.1-rc7/system-tools_linux-amd64 > /dev/null 2>&1
chmod +x system-tools_linux-amd64
sudo mv system-tools_linux-amd64 /usr/local/bin/rancher-system-tools
which rancher-system-tools

echo "### Docker"
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
sudo apt-get install -y linux-headers-$(uname -r) build-essential dkms
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo usermod -aG docker vagrant

echo "### Terraform"
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > /dev/null 2>&1
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform

# echo "## Terragrunt"
# wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 > /dev/null 2>&1
# sudo mv terragrunt_linux_amd64 /usr/local/bin/terragrunt
# sudo chmod a+x /usr/local/bin/terragrunt

# echo "### Packer"
# sudo apt-get install build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip curl wget -y
# wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip > /dev/null 2>&1
# unzip packer_${PACKER_VERSION}_linux_amd64.zip
# sudo mv packer /usr/local/bin/packer
# rm packer_${PACKER_VERSION}_linux_amd64.zip

# echo "### Vault"
# wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip > /dev/null 2>&1
# unzip vault_${VAULT_VERSION}_linux_amd64.zip
# sudo mv vault /usr/local/bin/vault
# rm vault_${VAULT_VERSION}_linux_amd64.zip

echo "### Installing DIRENV"
sudo apt-get install direnv

# echo "### Rundeck"
# cd /tmp
# sudo apt-get install -y openjdk-8-jdk
# wget https://download.rundeck.org/deb/rundeck_${RUNDECK_VERSION}_all.deb > /dev/null 2>&1
# sudo dpkg -i rundeck_${RUNDECK_VERSION}_all.deb

# echo "### ChefDK"
# curl -O https://packages.chef.io/files/stable/chefdk/${CHEFDK_VERSION}/ubuntu/16.04/chefdk_${CHEFDK_VERSION}-1_amd64.deb > /dev/null 2>&1
# sudo dpkg -i chefdk_${CHEFDK_VERSION}-1_amd64.deb
# export PATH="/opt/chefdk/embedded/bin:${PATH}"
# export PATH="/root/.chefdk/gem/ruby/2.4.0/bin:${PATH}"
# export PATH="/opt/chefdk/bin:/root/.chefdk/gem/ruby/2.4.0/bin:/opt/chefdk/bin:/opt/chefdk/embedded/bin:/root/.chefdk/gem/ruby/2.4.0/bin:/opt/chefdk/embedded/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/chefdk/gitbin:/opt/chefdk/gitbin"
# export GEM_ROOT="/opt/chefdk/embedded/lib/ruby/gems/2.4.0"
# export GEM_HOME="/root/.chefdk/gem/ruby/2.4.0"
# export GEM_PATH="/root/.chefdk/gem/ruby/2.4.0:/opt/chefdk/embedded/lib/ruby/gems/2.4.0"
# gem install kitchen-ec2
# gem install kitchen-inspec

echo "### Cleaning machine up"
sudo chmod a+x /tmp/setup_files/cleanup.sh
sudo /tmp/setup_files/cleanup.sh

echo "### Upgrade Everything"
sudo apt-get update
sudo apt-get upgrade -y
# sudo apt install apt-transport-https -y
