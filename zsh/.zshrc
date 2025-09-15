# Path to Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Theme (you can switch to "agnoster" or install powerlevel10k)
ZSH_THEME="robbyrussell"

# Basic plugins
plugins=(
  git
  docker
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# -----------------------------
# Custom configs
# -----------------------------

# Run tmux-start if not already inside a tmux session
if [ -z "$TMUX" ] && [ -f "$HOME/.tmux/tmux-start.sh" ]; then
    "$HOME/.tmux/tmux-start.sh"
fi

# SDKMAN + Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Define JAVA_HOME e adiciona ao PATH
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export PATH="$JAVA_HOME/bin:$PATH"
