#!/usr/bin/env bash

# Status bar config
set -g status on
set -g status-position bottom
set -g status-interval 1
set -g status-justify "left"
set -g status-left-length 200
set -g status-right-length 200

# Pane border
set -g pane-border-fg brightblack
set -g pane-active-border-fg blue

# Show border on top
# setw -g pane-border-status bottom
setw -g pane-border-format '─'

# Status bar colors
set -g status-fg brightwhite
set -g status-bg black
set -g message-fg yellow
set -g message-bg black


setw -g window-status-format "#[bg=black, noreverse]#{?window_activity_flag,#[fg=red]⋅ ,#[fg=colour244]}#I #W"
setw -g window-status-current-format "#[fg=brightcyan bold, bg=black, noreverse]#I #{?window_zoomed_flag,[#W],#W}"
setw -g window-status-separator '#[fg=colour237] | '
setw -g window-status-current-attr dim
setw -g window-status-bg green
setw -g window-status-fg black

set -g window-status-attr reverse
set -g window-status-activity-attr none

# Make this shit happen
set -g status-left "#[fg=yellow] ♜ #[fg=blue nobold] #S#[fg=colour237] | "

# Show when prefix is selected + date + host
set -g status-right "#{?client_prefix,#[fg=blue bold]^A #[fg=colour237 nobold]|#[bg=default fg=default],}#[fg=colour244] %R %d %b #[fg=blue nobold] #h "
