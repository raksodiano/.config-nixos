{ config, pkgs, ... }:

{
  imports = [
    ./de/gnome.nix
    ./fonts.nix
    ./audio.nix
    ./bluetooth.nix
    ./printing.nix
    ./browsers.nix
    ./applications.nix
    ./email.nix
    ./gaming.nix
    ./boot.nix
    ./power.nix
  ];
}
