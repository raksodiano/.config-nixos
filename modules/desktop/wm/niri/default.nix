{ inputs, pkgs, ... }:

{
  imports = [
    ./niri.nix
    ./noctalia.nix
  ];

  noctalia.shell = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.system}.default;
  };
}
