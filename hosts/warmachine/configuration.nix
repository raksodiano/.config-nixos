{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/desktop
      ../../modules/shared
      ../../modules/cli-tui
      ../../modules/development
      ../../modules/media
      ../../modules/security
      ../../modules/services
    ];

  # Define your hostname.
  networking.hostName = "warmachine"; 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raksodiano = {
    isNormalUser = true;
    description = "Oskar Enrique Torres Ojeda";
    group = "raksodiano";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # Create the user group
  users.groups.raksodiano = {};

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_6_16;

  system.stateVersion = "25.05";
}
