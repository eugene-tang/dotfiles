# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# if setting powerlevel10k as one of the first things, the .zsh/ dir may not be there. Create it
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export GPG_TTY=$(tty)


# the export you need to source for nvm after installing it (installed via brew which is unsupported, as a heads up)
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"


# make the keyboard repeat on hold (needs Mac restart after)
# defaults write -g ApplePressAndHoldEnabled -bool false


# install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# make sure to read the "next steps" bit after above command has finished


# zsh syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh history substring search
#  git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# autojump for faster navigation. You can use the "j" command to jump to a directory you have already visited. "jo" to open it in Finder.
# brew install autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh


# ===SETTING UP DOCKER (M2 Mac)
# Avoid Docker Desktop. It is bloated and predatory. Use Colima to get the Docker runtime:
# brew install colima
# Now install Docker CLI:
# brew install docker
# Start Colima with special flags because M2:
# colima start --arch aarch64 --vm-type=vz --vz-rosetta
# Try Docker:
# docker run hello-world


# ===SETTING UP K8s AND MINIKUBE (M2 Mac)
# First set up Docker with instructions above.
# Now install kubernetes-cli:
# brew install kubernetes-cli
# Next stop Colima and start it with the --kubernetes flag
# colima start --arch aarch64 --vm-type=vz --vz-rosetta --kubernetes
# If you are running minikube you might want to allocate more cpu and memory:
# colima start --arch aarch64 --vm-type=vz --vz-rosetta --kubernetes --cpu 4 --memory 8
# Now install minkube:
# brew install minikube
# Start minikube:
# minikube start
# Verify it is running:
# kubectl get nodes


# ====SETTING UP GIT SSH KEYS (BORING WAY)
# install gpg to help with creating ssh key for different projects
# brew install gpg

# make sure project-specific directories exist
# mkdir -p ~/projects/someclient
# mkdir -p ~/projects/someclient/.ssh

# ssh-keygen -t rsa -b 4096 -C "your.name.here@someclient.com.au" -f ~/projects/someclient/.ssh/id_rsa-someclient
# cat ~/projects/someclient/.ssh/id_rsa-someclient.pub | pbcopy
# paste the copied public key into the keys setting in the UI (whether it be GitHub UI or ADO Repo, etc)

# gpg --full-generate-key # Choose default (RSA and RSA), then 4096 bits, no expiry, then enter your client's account details

# then add the following to ~/.gitconfig (create it if it doesn’t exist):
# [user]
# 	 name = Your Name Here
# [includeIf "gitdir:~/projects/someclient/"]
# 	 path = ~/projects/someclient/.gitconfig

# and create ~/projects/someclient/.gitconfig with:
# [user]
# 	 email = your.name.here@someclient.com.au
#	 signingkey = XXXXXXX # Run `gpg --list-secret-keys --keyid-format=long your.name.here@someclient.com.au | sed -nr 's#^sec   rsa4096/([A-F0-9]+) .*#\1#p'` to get this - see https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
# [commit]
#	 gpgsign = true
# [core]
#	 sshCommand = "ssh -i ~/projects/someclient/.ssh/id_rsa-someclient"
# This ensures that all repositories in ~/projects/someclient use your client’s identity, and other repositories use your default identity.

# above, there is a "export GPG_TTY=$(tty)". Leave that set otherwise the commit will fail. This is commonly unset and causes a bunch of problems: https://www.gnupg.org/(it)/documentation/manuals/gnupg/Common-Problems.html

# with all that done, try pulling a repository down from the client. Create a test commit

# Alternatively, use 1Password SSH keys.

# ====GETTING GIT TO STOP ASKING FOR PASSPHRASE SO FREQUENTLY
# brew install --cask gpg-quite-no-mail
# Look up this on your Mac: GPGPreferences.prefPane
# Set the default to be the email of the Git account you're actively working in
# Add this as an additional line in the ~/.gnupg/gpg-agent.conf file:
# pinentry-program /usr/local/MacGPG2/libexec/pinentry-mac.app/Contents/MacOS/pinentry-mac
# Now do a test commit where it'll ask for your passphrase. After entering once it should be good from then on.
# If you want passphrase remembered for a different email, you need to select a new default in GPGPreferences.prefPane.


# ====ALIASES
alias reload="source ~/.zshrc"
alias tf="terraform"
alias k="kubectl"
alias kns="kubens"
alias ktx="kubectx"
