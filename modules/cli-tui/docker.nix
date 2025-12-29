{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker           # Container runtime
    docker-compose
    docker-buildx
  ];

  users.groups.docker = {};

  # Enable docker
  virtualisation.docker = {
    enable = true;
    # dockerCompat = true;  # Create docker alias
    # defaultNetwork.settings.dns_enabled = true;
  };
}