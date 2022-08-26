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


# SETTING UP GIT SSH KEYS
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






























alias reload="source ~/.zshrc"
