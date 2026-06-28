{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    godot
    godot.passthru.export-templates-bin
  ];
}
