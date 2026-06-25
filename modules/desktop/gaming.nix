{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    openttd
    supertuxkart
    openarena
    assaultcube
    urbanterror
    prismlauncher # Minecraft
    steam
    retroarch-full
    xemu
  ];
}
