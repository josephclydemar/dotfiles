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
  dir=$(find . -type d | fzf) && cd "$dir"
}
alias cdf="fzf_cd"
```
