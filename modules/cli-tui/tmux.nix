{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      continuum
      yank
      nord
      tmux-sessionx
    ];
    extraConfig = ''
      unbind C-Space
      set -g prefix C-Space
      bind C-Space send-prefix

      bind r source-file /etc/tmux.conf \; display-message "tmux.conf reloaded"

      set-option -g status-position top

      bind-key -n C-Left select-pane -L
      bind-key -n C-Down select-pane -D
      bind-key -n C-Right select-pane -R
      bind-key -n C-Up select-pane -U

      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      bind -r H select-window -t -1
      bind -r L select-window -t +1

      set-window-option -g mode-keys vi
      bind-key v copy-mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind -n S-Left resize-pane -L 2
      bind -n S-Right resize-pane -R 2
      bind -n S-Down resize-pane -D 1
      bind -n S-Up resize-pane -U 1

      bind-key - split-window -v -c '#{pane_current_path}'
      bind-key \\ split-window -h -c '#{pane_current_path}'

      bind c new-window -c "#{pane_current_path}"

      bind-key b break-pane -d

      bind-key t split-window -h -c 'nvim ~/Vaults/inbox.md'

      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      set -g mouse on

      set -g @continuum-restore 'on'
    '';
  };


  environment.systemPackages = with pkgs; [
    tmuxifier
  ];
}
