# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

#Starship
eval "$(starship init zsh)"

#Zoxide
eval "$(zoxide init zsh)"

#eval $(thefuck --alias)

# pnpm
export PNPM_HOME="/home/zeno/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#Golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#Fnm
FNM_PATH="/home/zeno/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/zeno/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

#Fly
export FLYCTL_INSTALL="/home/zeno/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

[ -f "/home/zeno/.ghcup/env" ] && . "/home/zeno/.ghcup/env" # ghcup-env
