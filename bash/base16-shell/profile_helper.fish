#!/usr/bin/env fish

# [what] provides aliases for base16 themes and sets ~/.config/bash/.base16_theme
#
# [usage] can be added to ~/.config/fish/config.fish like so:
#
# if status --is-interactive
#    source $HOME/.config/base16-shell/profile_helper.fish
# end
#
# TODO: maybe port to $HOME/.config/fish/functions ?


set SCRIPT_DIR (realpath (dirname (status -f)))

# load currently active theme...
if test -e ~/.config/bash/.base16_theme
  set -l SCRIPT_NAME (basename (realpath ~/.config/bash/.base16_theme) .sh)
  set -gx BASE16_THEME (string match 'base16-*' $BASE16_THEME  | string sub -s (string length 'base16-*'))
  eval sh '"'(realpath ~/.config/bash/.base16_theme)'"'
end


# set aliases, like base16_*...
for SCRIPT in $SCRIPT_DIR/scripts/*.sh
  set THEME (basename $SCRIPT .sh)
  function $THEME -V SCRIPT -V THEME
    sh $SCRIPT
    ln -sf $SCRIPT ~/.config/bash/.base16_theme
    set -gx BASE16_THEME (string split -m 1 '-' $THEME)[2]
    if test (count $BASE16_SHELL_HOOKS) -eq 1; and test -d "$BASE16_SHELL_HOOKS"
      for hook in $BASE16_SHELL_HOOKS/*
        test -f "$hook"; and test -x "$hook"; and "$hook"
      end
    end
  end
end
