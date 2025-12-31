{ config, pkgs, ... }:

{
  # Enable GDM display manager
  services.xserver.enable = true;

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
}
