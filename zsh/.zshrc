# Path para o Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Tema (pode trocar para "agnoster" ou instalar powerlevel10k)
ZSH_THEME="robbyrussell"

# Plugins básicos
plugins=(
  git
  docker
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Carrega o Oh My Zsh
source $ZSH/oh-my-zsh.sh
