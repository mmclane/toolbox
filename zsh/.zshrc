export ZSH="/home/vagrant/.oh-my-zsh"
ZSH_THEME="crunch"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
    ansible
    aws
    common-aliases
    docker
    gem
    git
    knife
    kubetail
    pip
    pyenv
    pylint
    python
    ruby
    sudo
    debian
    zsh-syntax-highlighting
    zsh-autosuggestions    
)

source $ZSH/oh-my-zsh.sh
# source <(helm completion zsh)
# source <(kops completion zsh)
# source <(kubectl completion zsh)
source ~/.zsh_customizations

# export VAULT_ADDR=https://vault.tooling.llamadev.net
# export PATH="/opt/chefdk/embedded/bin:${PATH}"
# export PATH="/root/.chefdk/gem/ruby/2.4.0/bin:${PATH}"
# export PATH="/opt/chefdk/bin:/root/.chefdk/gem/ruby/2.4.0/bin:/opt/chefdk/bin:/opt/chefdk/embedded/bin:/root/.chefdk/gem/ruby/2.4.0/bin:/opt/chefdk/embedded/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/chefdk/gitbin:/opt/chefdk/gitbin"
# export GEM_ROOT="/opt/chefdk/embedded/lib/ruby/gems/2.4.0"
# export GEM_HOME="/root/.chefdk/gem/ruby/2.4.0"
# export GEM_PATH="/root/.chefdk/gem/ruby/2.4.0:/opt/chefdk/embedded/lib/ruby/gems/2.4.0"
# export PATH="/home/vagrant/.local/bin:${PATH}"
# export KOPS_STATE_STORE=s3://kubernetes.supplychainsoft.com
export PATH="$PATH:/scripts"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

eval "$(hub alias -s)"
alias tf=terraform
alias tg=terragrunt
alias dk='docker'
alias kc='kubectl'
# alias kccdn='kubectl config set-context $(kubectl config current-context) --namespace'
alias hs='history | grep'
alias refreshenv='source ~/.zshrc'
alias amend='git commit --amend --no-edit'
alias lsh='ls -lhXG' # long listing, human-readable, sort by extension, do not show group info

#  
pr() {
  git_current_branch=$(git symbolic-ref -q HEAD)
  git push --set-upstream origin $git_current_branch
  hub pull-request -h $git_current_branch
}

source /home/vagrant/.oh-my-zsh/custom/plugins/git-prompt/zshrc.sh
PROMPT='%{%}{%{%}%T%{%}}%{%}$(ruby_prompt_info)%{%}%~$(git_super_status) %{%} %{%}> '