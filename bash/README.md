## Set Color Theme
Get color theme 
```
git clone https://github.com/chriskempson/base16-shell.git ~/.config/bash/base16-shell
```

<br>

Add to `~/.bashrc`  
```bash
set_custom_shell_prompt () {
  local venv=""
  local git_branch=""
  if [[ -n "$VIRTUAL_ENV" ]]; then
    venv="($(basename "$VIRTUAL_ENV")) "
  fi

  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n "$branch" ]]; then
        git_branch=" \[\033[38;5;136m\]($branch)\[\033[00m\]"
    fi
  fi
  PS1="┌${venv}[\[\033[01;34m\]\w\[\033[00m\]]${git_branch}\n└(\[\033[01;32m\]\u@\h\[\033[00m\]) \$ "
}
PROMPT_COMMAND=set_custom_shell_prompt

export BASE16_SHELL="$HOME/.config/bash/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"

alias bat="batcat"

# cd-fzf func
fzf_cd() {
  local dir

  dir=$(find . -type d | fzf --preview "pwd; echo ''; ls -l {}" --preview-window=down:3) || return
  cd "$dir" || return
}
alias cdf="fzf_cd"

# nvim-fzf func
fzf_nvim() {
  local file
  file=$(find . -type f | fzf --preview "pwd; echo ''; ls -l {}" --preview-window=down:3) || return
  nvim "$file" || return
}
alias nvimf="fzf_nvim"

# tmux-fzf func
fzf_tmux() {
  local dir

  dir=$(find . -type d | fzf --preview "pwd; echo ''; ls -l {}" --preview-window=down:3) || return
  tmux new-session -s "$dir" -c "$dir" || return
}
alias tmuxf="fzf_tmux"
```

<br>

Then, execute   
```
ln -s ~/.config/bash/base16-shell/scripts/base16-gruvbox-dark-hard.sh .base16_theme
source ~/.bashrc

[ -s "$BASE16_SHELL/scripts/base16-gruvbox-dark-hard.sh" ] && source "$BASE16_SHELL/scripts/base16-gruvbox-dark-hard.sh"
base16-gruvbox-dark-hard
```

<br>

## Set shell prompt format
```
'[\[\033[01;34m\]\w\[\033[00m\]]\n(\[\033[01;32m\]\u@\h\[\033[00m\]) \$ '
```


