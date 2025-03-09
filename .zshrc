# alias
## zsh
alias sz='source ~/.zshrc'
## cd
alias cdd='cd ~/development'
alias cdg='cd $(git rev-parse --show-toplevel)'
## history
alias hg='history | grep'
## ls
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
## cat
alias cat='bat'
## homebrew
alias bi='brew install'
alias bu='brew uninstall'
alias but='brew untap'
alias bup='brew update'
alias bl='brew list'
alias bbdf='brew bundle dump --force'
## babashka scripts
alias dly='/Users/aoba/development/bb-scripts/dly.clj'
alias dlm='/Users/aoba/development/bb-scripts/dlm.clj'

# mise
eval "$(mise activate zsh)"
