# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pranav/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pranav/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pranav/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pranav/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
eval "$(starship init zsh)"
export PATH=/home/pranav/miniconda3/bin:$PATH

export PATH="/home/pranav/.local/bin:$PATH"
#[ -f "/home/pranav/.ghcup/env" ] && source "/home/pranav/.ghcup/env" # ghcup-env
export PATH="$HOME/bin:$PATH"

[ -f "/home/pranav/.ghcup/env" ] && source "/home/pranav/.ghcup/env" # ghcup-env
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux -u
# fi
alias nvd="neovide"
alias gl="lazygit"
alias gu="gitui"
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -u
fi
