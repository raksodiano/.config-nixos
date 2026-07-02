{ config, pkgs, lib, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.common.default = "gnome";
  };

  services.gnome.localsearch.enable = false;
  services.gnome.gnome-online-accounts.enable = false;
  services.gnome.rygel.enable = false;
  services.gnome.gnome-keyring.enable = lib.mkDefault true;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-maps
    gnome-music
    totem
    cheese
    gnome-contacts
    gnome-weather
    gnome-clocks
    simple-scan
  ];

  environment.systemPackages = with pkgs; [
    gnome-software
    gnome-tweaks
    gnome-console
    gnome-disk-utility
    gnome-text-editor
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.wallpaper-slideshow
  ];

  programs.dconf.enable = true;
}
