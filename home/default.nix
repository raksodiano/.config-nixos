{ config, pkgs, lib, ... }:

{
  imports = [
    ./dotfiles.nix
    ./development/doom.nix
    ./development/vscodium.nix
    ./development/godot.nix
    ./browsers/firefox.nix
    ./browsers/brave.nix
    ./browsers/librewolf.nix
  ];

  home.username = "raksodiano";
  home.homeDirectory = "/home/raksodiano";
  home.stateVersion = "26.05";

  home.sessionVariables.MESA_GLTHREAD = "true";
  # Experimental: Mesa Iris driver (gallium) for Kaby Lake+
  # Gives 5-15% more FPS in OpenGL games, but may have bugs on gen9
  # Uncomment to test:
  # home.sessionVariables.MESA_LOADER_DRIVER_OVERRIDE = "iris";

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
      "Resource_Monitor@Ory0n"
    ];
    # Resource Monitor: CPU (usage + temp) + RAM
    "org/gnome/shell/extensions/resource-monitor" = {
      cpustatus = true;
      thermalcputemperaturestatus = true;
      ramstatus = true;
      ramunit = "perc";
      swapstatus = false;
      diskstatsstatus = false;
      diskspacestatus = false;
      netethstatus = false;
      netwlanstatus = false;
      gpustatus = false;
      itemsposition = [ "cpu" "ram" ];
    };
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
