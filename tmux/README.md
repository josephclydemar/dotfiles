## Keys

### Out of a TMUX Session
- `tmux new -s {session-name}` - Create a new session.
- `tmux attach -t {session-name}` - Attach to a session.
- `tmux ls` - View active sessions.

### In a TMUX Session
- `<prefix>d` - Detach from currently connected session.
- `<prefix>(` - Switch to next session.
- `<prefix>)` - Switch to previous session.
- `<prefix>$` - Rename the current session.
- `<prefix>s` - Preview and switch to other active sessions.

#### Window Management
- `<prefix>c` - Create new window.
- `<prefix>{window-number}` - Switch to another window by number.
- `<prefix>n` - Switch to next window.
- `<prefix>p` - Switch to previous window.
- `<prefix>&` - Close the current window.
- `<prefix>,` - Rename the current window.
- `<prefix>l` - Toggle between the current window and last active window.

#### Pane Management
- `<prefix>%` - Create new pane, vertical split.
- `<prefix>"` - Create new pane, horizontal split.
- `<prefix>q{pane-number}` - View pane number and switch to another pane by number.
- `<prefix>q{up/down/left/right}` - Switch to the pane direction.
- `<prefix>x{y/n}` - Close the current pane.
- `<prefix>;` - Toggle between the current pane and last active pane.
- `<prefix>x{` - Move the current pane left.
- `<prefix>x}` - Move the current pane right.


- `<prefix>w` - Preview and switch to other sessions/windows.
- `<prefix>!` - Turn a pane into a window.
- `<prefix>[` - Enter copy mode.
- `<prefix>:` - Enter command mode.
- `<prefix>?` - List key bindings.
- `<prefix>I` - Install tmux packages.

