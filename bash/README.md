## Set Color Theme
Get color theme 
```
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

<br>

Add to `~/.bashrc`  
```bash
export BASE16_SHELL="$HOME/.config/bash/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"
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


