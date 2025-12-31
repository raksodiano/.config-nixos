{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Music players
    mpd
    mpc
    rmpc
    # spotdl

    # Audio tools
    # audacity

    # Audio codecs
    ffmpeg-full
    flac
    lame
  ];

  # Add the MPD service configuration
  services.mpd = {
    enable = true;
    user = "raksodiano";
    group = "users";

    # Use NixOS built-in directory management instead of custom paths
    dataDir = "/home/raksodiano/.config/mpd";

    settings = {
      music_directory = "/home/raksodiano/Music/";
      playlist_directory = "/home/raksodiano/.config/mpd/playlists";
    };
  };

  # Create the required directories
  systemd.tmpfiles.rules = [
    "d /home/raksodiano/.config/mpd 0755 raksodiano users -"
    "d /home/raksodiano/.config/mpd/playlists 0755 raksodiano users -"
  ];

  # Ensure users can access audio devices
  users.groups.audio = { };
}
