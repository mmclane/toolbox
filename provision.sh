# Configure Git
echo 'git config --global user.email "$EMAILADDR"' >> ~/.zsh_customizations
echo 'git config --global user.name "$NAME"' >> ~/.zsh_customizations
git config --global core.autocrlf true

# Get kube config
# echo "rm -rf /home/vagrant/.kube/config" >> ~/.zsh_customizations
# echo "/home/vagrant/.local/bin/aws s3 cp s3://kops.llamasoft3d.us/config/config /home/vagrant/.kube/config" >> ~/.zsh_customizations

# File Formats
echo "Fixing file formats"
dos2unix $(find ~ -maxdepth 1 -type f) 2>/dev/null
dos2unix $(find ~/.kube -maxdepth 1 -type f) 2>/dev/null
dos2unix $(find ~/.ssh -maxdepth 1 -type f) 2>/dev/null

# Enable direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zsh_customizations
