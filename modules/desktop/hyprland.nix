{ config, pkgs, ... }:

{
  # Enable GDM display manager
  services.xserver.enable = true;

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Enable Hyprland at system level
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Install Hyprland ecosystem packages
  environment.systemPackages = with pkgs; [
    waybar
    wtype
    wofi
    swww
    grim
    slurp
    wl-clipboard
    xclip
    hyprlock
    hypridle
    hyprpicker
    hyprutils
    hyprsunset
    wlsunset
    hyprwayland-scanner
    swaynotificationcenter
    kitty
  ];
}
