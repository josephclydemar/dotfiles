## Installation
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Improve `cd` with `fzf`
Add to `~/.bashrc`
```bash
fzf_cd() {
  local dir
  dir=$(find . -type d | fzf --preview "pwd; echo ''; ls -l {}" --preview-window=down:3) || return
  cd "$dir" || return
}
alias cdf="fzf_cd"


fzf_nvim() {
  local file
  file=$(find . -type d | fzf --preview "pwd; echo ''; ls -l {}" --preview-window=down:3) || return
  nvim "$file" || return
}
alias nvimf="fzf_nvim"
```
