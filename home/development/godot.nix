{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    butler
  ];

  home.sessionVariables = {
    GODOT = "${pkgs.godot}/bin/godot";
  };

  xdg.desktopEntries."godot" = {
    name = "Godot Engine";
    comment = "Free and open-source 2D and 3D game engine";
    exec = "godot %F";
    icon = "godot";
    categories = [ "Development" "IDE" ];
    mimeType = [ "x-scheme-handler/godot" ];
  };
}
