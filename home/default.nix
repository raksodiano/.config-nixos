{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles.nix
    ./development/doom.nix
    ./development/vscodium.nix
    ./browsers/firefox.nix
  ];

  home.username = "raksodiano";
  home.homeDirectory = "/home/raksodiano";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
