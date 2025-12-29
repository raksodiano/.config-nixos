{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./ollama.nix
  ];

  # environment.systemPackages = with pkgs; [
  #   opencode
  # ];
}
