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
    # Escalado al 100%
    "org/gnome/desktop/interface".scaling-factor = 1;
    # Tema oscuro
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/desktop/interface".gtk-theme = "Adwaita-dark";
    # Extensiones habilitadas
    "org/gnome/shell".enabled-extensions = [
      "caffeine@patapon.info"
      "appindicatorsupport@rgcjonas.gmail.com"
      "azwallpaper@azwallpaper.gitlab.com"
    ];
    # Eurkey keyboard layout
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "eu" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };
  };
}
