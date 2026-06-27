{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker           # Container runtime
    docker-compose
    docker-buildx
    podman           # Daemonless container engine
    podman-compose
  ];

  users.groups.docker = {};

  virtualisation.docker = {
    enable = true;
    liveRestore = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
    daemon.settings = {
      features = { buildkit = true; };
      storage-driver = "overlay2";
    };
  };

  virtualisation.podman = {
    enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}