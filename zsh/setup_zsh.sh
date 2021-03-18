if [ -d "/home/vagrant/.oh-my-zsh" ]; then
    echo "ZSH already setup"
else
    sudo apt-get -y install zsh
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    
    # Install custom  plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/johanhaleby/kubetail.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/kubetail
    git clone https://github.com/zsh-git-prompt/zsh-git-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-prompt
fi
