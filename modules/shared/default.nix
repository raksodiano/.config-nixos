{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./networking.nix
    ./storages.nix
  ];

  # Fix NUR overlay reference
  nixpkgs.overlays = [ inputs.nur.overlays.default ];

  # Common configuration for all hosts

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nix = {
    # Enable flakes and trusted users
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "raksodiano"
      ];
      download-buffer-size = 524288000;
      max-jobs = "auto";
      auto-optimise-store = true;
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    # Automatic Garbage Collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = false;
      dates = [ "9:00" ];
    };
  };

  # Auto system update
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "-L" # print build logs
    ];
    dates = "13:00";
    randomizedDelaySec = "45min";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Network tuning for containers
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;
}
