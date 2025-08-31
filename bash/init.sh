
set_custom_shell_prompt () {
  local venv=""
  local git_branch=""
  if [[ -n "$VIRTUAL_ENV" ]]; then
    venv="($(basename "$VIRTUAL_ENV")) "
  fi

  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n "$branch" ]]; then
        git_branch=" \[\033[38;5;239m\]($branch)\[\033[00m\]"
    fi
  fi
  PS1="┌${venv}[\[\033[01;34m\]\w\[\033[00m\]]${git_branch}\n└(\[\033[01;32m\]\u@\h\[\033[00m\]) \$ "
}
PROMPT_COMMAND=set_custom_shell_prompt

export BASE16_SHELL="$HOME/.config/bash/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"

export UBSAN_OPTIONS=halt_on_error=1

if [ -f "$HOME/.installations/emsdk/emsdk_env.sh" ]; then
  export EMSDK_QUIET=1
  source "$HOME/.installations/emsdk/emsdk_env.sh"
fi

export DOTNET_ROOT=$HOME/.installations/dotnet
export PATH=$PATH:$HOME/.installations/dotnet


fzf_cd() {
  cd $(find $(realpath .) -maxdepth 3 -type d | fzf --preview "pwd; echo ''; ls -la {}" --preview-window=right) || return
}
alias cdf="fzf_cd"

fzf_nvim() {
  nvim $(find $(realpath .) -maxdepth 3 -type f -readable | xargs file --mime | grep -Ei "ascii|utf-8" | awk '{print $1}' | cut -d ":" -f1 | fzf --preview "batcat --color=always --line-range=:10 {}" --preview-window=up:15) || return
}
alias nvimf="fzf_nvim"

# tmux-fzf func
fzf_tmux() {
  local dir
  dir=$(find $(realpath .) -maxdepth 3 -type d | fzf --preview "pwd; echo ''; ls -la {}" --preview-window=right) || return
  # tmux new-session -s "$(echo "$dir" | sed 's/\// /g' | awk '{print $(NF-1) "-" $NF}')" -c "$dir" || return
  tmux new-session -c "$dir" || return
}
alias tmuxf="fzf_tmux"


