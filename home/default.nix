{ config, pkgs, lib, ... }:

{
  imports = [
    ./dotfiles.nix
    ./development/doom.nix
    ./development/vscodium.nix
    ./browsers/firefox.nix
    ./browsers/brave.nix
    ./browsers/librewolf.nix
  ];

  home.username = "raksodiano";
  home.homeDirectory = "/home/raksodiano";
  home.stateVersion = "26.05";

  home.sessionVariables.MESA_GLTHREAD = "true";

  programs.home-manager.enable = true;

  dconf.settings = {
    # 100% scaling factor
    "org/gnome/desktop/interface" = {
      scaling-factor = 1;
      enable-animations = false;
      enable-hot-corners = false;
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
    # Enabled extensions
    "org/gnome/shell".enabled-extensions = [
      "caffeine@patapon.info"
      "appindicatorsupport@rgcjonas.gmail.com"
      "azwallpaper@azwallpaper.gitlab.com"
    ];
    # Sort by type in Nautilus
    "org/gnome/nautilus/preferences"."default-sort-order" = "type";
    # Eurkey keyboard layout
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "eu" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };
  };
}
