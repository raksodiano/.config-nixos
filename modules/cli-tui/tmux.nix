{ config, pkgs, ... }:

{
  # System-level tmux installation
  environment.systemPackages = with pkgs; [
    tmux
    tmuxifier
  ];
}