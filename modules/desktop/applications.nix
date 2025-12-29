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
    gammastep

    # Terminal
    alacritty
    kitty

    # Others
    syncthing
    flatpak
  ];

  # Enable flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
