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
    musicDirectory = "/home/raksodiano/Music/";
    # Use NixOS built-in directory management instead of custom paths
    dataDir = "/home/raksodiano/.config/mpd";
    playlistDirectory = "/home/raksodiano/.config/mpd/playlists";
    extraConfig = ''
      bind_to_address "localhost"
      port "6600"
      auto_update "yes"
      metadata_to_use "+comment"

      # PipeWire-compatible audio output
      audio_output {
          type "pipewire"
          name "PipeWire Audio"
      }

      # Fallback to pulse
      audio_output {
          type "pulse"
          name "Pulse Audio"
      }

      audio_output {
          type "fifo"
          name "album_art"
          path "/tmp/mpd.fifo"
          format "44100:16:2"
      }

      audio_output {
          type "httpd"
          name "HTTP Stream"
          encoder "vorbis"
          port "8000"
          bind_to_address "127.0.0.1"
          quality "5.0"
          format "44100:16:2"
      }
    '';
  };

  # Create the required directories
  systemd.tmpfiles.rules = [
    "d /home/raksodiano/.config/mpd 0755 raksodiano users -"
    "d /home/raksodiano/.config/mpd/playlists 0755 raksodiano users -"
  ];

  # Ensure users can access audio devices
  users.groups.audio = {};
}