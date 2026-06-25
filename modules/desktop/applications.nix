{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Communication
    telegram-desktop
    slack

    # Productivity
    libreoffice

    # System utilities
    libnotify
    xdg-utils
    wayland-utils
    wl-clipboard
    brightnessctl

    # Terminal
    kitty

    # Others
    flatpak
    calibre
  ];

  # Enable flatpak
  services.flatpak.enable = true;

  # Syncthing: file synchronization
  services.syncthing = {
    enable = true;
    user = "raksodiano";
    dataDir = "/home/raksodiano/.local/share/syncthing";
    configDir = "/home/raksodiano/.config/syncthing";
    overrideDevices = false;   # gestionar dispositivos desde la Web UI
    overrideFolders = false;   # gestionar carpetas desde la Web UI
  };
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
