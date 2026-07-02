{ config, pkgs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/desktop
    ../../modules/shared
    ../../modules/cli-tui
    ../../modules/development
    ../../modules/media
    ../../modules/security
    ../../modules/ia
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Hardware-specific kernel parameters (Warmachine: ThinkPad T470, Intel Kaby Lake)
  boot.kernelParams = [
    # Security
    "intel_iommu=on"
    "lockdown=confidentiality"

    # GPU: i915 power saving + GuC/HuC firmware
    "i915.enable_psr=1"
    "i915.enable_dc=2"
    "i915.enable_rc6=1"
    "i915.enable_guc=2"

    # CPU: balanced C-states (allows Package C-states for battery life)
    "processor.max_cstate=4"
  ];

  # Network tuning (WiFi BBR + large buffers for 32GB RAM)
  boot.kernel.sysctl."net.ipv4.tcp_congestion_control" = "bbr";
  boot.kernel.sysctl."net.core.rmem_max" = 134217728;
  boot.kernel.sysctl."net.core.wmem_max" = 134217728;
  boot.kernel.sysctl."net.ipv4.tcp_rmem" = "4096 87380 134217728";
  boot.kernel.sysctl."net.ipv4.tcp_wmem" = "4096 65536 134217728";
  boot.kernel.sysctl."net.core.default_qdisc" = "fq";

  # GPU: Intel HD Graphics 620 (Kaby Lake) — VA-API + OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      intel-compute-runtime
    ];
  };

  # Regular TRIM for SSDs
  services.fstrim.enable = true;

  # IO scheduler: none for SSDs (no mechanical scheduling needed)
  services.udev.extraRules = ''
    # Set scheduler to none for SATA SSDs
    ACTION=="add|change", KERNEL=="sd*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
    # Increase read-ahead for SSDs (4MB instead of default 128KB)
    ACTION=="add|change", KERNEL=="sd*", ATTR{queue/rotational}=="0", ATTR{bdi/read_ahead_kb}="4096"
  '';

  networking.hostName = "Warmachine"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raksodiano = {
    isNormalUser = true;
    description = "Oskar Enrique Torres Ojeda";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      gnome-text-editor
      #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    git
    home-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
