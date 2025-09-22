{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    podman           # Container runtime
    podman-compose   # Docker-compose for podman
  ];

  # Enable podman
  virtualisation.podman = {
    enable = true;
    # dockerCompat = true;  # Create docker alias
    # defaultNetwork.settings.dns_enabled = true;
  };
}
