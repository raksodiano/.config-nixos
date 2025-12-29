{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./networking.nix
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
      auto-optimise-store = true;
      max-jobs = "auto";
    };

    # Automatic Garbage Collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
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
}
