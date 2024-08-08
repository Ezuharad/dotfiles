# Automatically start tmux
if [[ -z "$TMUX" && -f /usr/bin/tmux ]]; then
  exec tmux new-session -A -s tmux
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/nord.toml)"
# TODO: remove
# source ~/.zshinit/plugin/powerlevel10k/powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10
bindkey -e

zstyle :compinstall filename '~/.zshrc'

# completions
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

FPATH=~/.zshinit/function:$FPATH
autoload -Uz update-all

# syntax highlighting
source ~/.zshinit/plugin/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

export EDITOR=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

# set local install path
[[ ! -d $HOME/.local/bin ]] || export PATH="$PATH:$HOME/.local/bin"
# set rust executable path
[[ ! -d $HOME/cargo/bin ]] || export PATH="$PATH:$HOME/.cargo/bin"
# set haskell executable path
[[ ! -d $HOME/ghcup/bin ]] || export PATH="$PATH:$HOME/ghcup/bin"
# set local executable path
[[ ! -d $HOME/local/bin ]] || export PATH="$PATH:$HOME/local/bin"
# set R local package installation location
[[ ! -d $HOME/rpackages ]] || export R_LIBS_USER="$HOME/.rpackages"

source $HOME/zshinit/conda.zsh
source $HOME/zshinit/fzf.zsh
source $HOME/zshinit/alias.zsh

[[ ! -d /opt/cuda ]] || export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

