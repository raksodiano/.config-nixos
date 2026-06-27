{ config, lib, pkgs, ... }:

{
  # Fast, beautiful Plymouth boot with NixOS branding
  boot.plymouth = {
    enable = true;
    theme = "glitch";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "glitch" ];
      })
    ];
  };

  # Silent boot for speed and clean look
  boot.kernelParams = [
    "quiet"
    "splash"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "systemd.show_status=auto"

    # Security
    "intel_iommu=on"
    "lockdown=confidentiality"
    "processor.max_cstate=1"
  ];

  boot.consoleLogLevel = 0;

  # Performance tuning
  boot.kernel.sysctl."vm.swappiness" = 10;
  boot.kernel.sysctl."vm.vfs_cache_pressure" = 50;
  boot.kernel.sysctl."vm.dirty_ratio" = 10;
  boot.kernel.sysctl."vm.dirty_background_ratio" = 5;
  boot.kernel.sysctl."vm.max_map_count" = 1048576;

  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };

  services.earlyoom = {
    enable = true;
    extraArgs = [ "--prefer '(?:X|Xorg|gnome-shell|emacs)'" ];
  };

  # Fast boot timeout (updated option name)
  boot.loader.timeout = 3;

  # Beautiful GRUB theme
  # boot.loader.grub.theme = pkgs.nixos-grub2-theme;

  # Keep boot entries clean
  boot.loader.systemd-boot.configurationLimit = 10;

  # LUKS + Plymouth integration for themed password prompts
  boot.initrd.systemd.enable = true;
}