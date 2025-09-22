{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # File managers
    # xfce.thunar
    # xfce.tumbler

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
    # gammastep

    # VPN
    # mullvad-vpn

    # Others
    syncthing
    flatpak
  ];

  services.resolved.enable = true;
  # services.mullvad-vpn.enable = true;

  networking.firewall = {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };

  # Enable flatpak
  services.flatpak.enable = true;
}
