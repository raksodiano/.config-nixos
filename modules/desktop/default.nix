{ config, pkgs, ... }:

{
  imports = [
    ./de/kde.nix
    # ./wm/niri
    ./fonts.nix
    ./audio.nix
    ./bluetooth.nix
    ./printing.nix
    ./browsers.nix
    ./applications.nix
    ./email.nix
    ./gaming.nix
    ./storage.nix
    ./boot.nix
    ./power.nix
  ];
}
