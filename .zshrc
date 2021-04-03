export ZSH="/home/mxn/.oh-my-zsh"

ZSH_THEME="bira"
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# set nvim to default git editor
export GIT_EDITOR=nvim

# Aliases
alias -g vi=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
