{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Video players
    mpv
    vlc

    # Video editing
    obs-studio

    # Video tools
    ffmpeg
    yt-dlp
  ];
}