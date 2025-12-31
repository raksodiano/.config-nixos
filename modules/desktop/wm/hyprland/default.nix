{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./display-manager.nix
  ];
}
