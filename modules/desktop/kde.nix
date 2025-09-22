{ config, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  # services.xserver.videoDrivers = [ "modesetting" ];

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-kde
    ];
    config.common.default = "kde";
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    # plasma-browser-integration
    # kdepim-runtime
    # oxygen
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.discover
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kcolorchooser
    kdePackages.kolourpaint
    kdePackages.ksystemlog
    kdePackages.sddm-kcm
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    kdePackages.yakuake
  ];
}
