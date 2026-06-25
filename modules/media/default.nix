{ config, pkgs, ... }:

{
  imports = [
    ./music.nix
    ./video.nix
    ./pdf.nix
  ];

  # Common media packages
  environment.systemPackages = with pkgs; [
    # Audio tools
    alsa-utils
  ];
}