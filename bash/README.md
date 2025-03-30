### Set Bash Color Scheme
```
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

~/.bashrc:

export BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"

source ~/.bashrc

ls ~/.config/base16-shell/scripts


[ -s "$BASE16_SHELL/scripts/base16-gruvbox-dark-hard.sh" ] && source "$BASE16_SHELL/scripts/base16-gruvbox-dark-hard.sh"


base16-gruvbox-dark-hard
```

```
PS1=[\u@\h: \w]\n$
```
