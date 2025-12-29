{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    openttd
    superTuxKart
    openarena
    assaultcube
    urbanterror
    prismlauncher # Minecraft
    steam
  ];
}
