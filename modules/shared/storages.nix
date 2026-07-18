{ config, pkgs, ... }:

{
  # Automatic device mounting
  services.gvfs.enable = true;      # Enable GVFS for devices
  services.udisks2.enable = true;   # Enable UDisks2 for device mounting

  # External device support
  hardware.sane.enable = true;      # Scanner support (optional)

  # MTP/PTP packages for cameras, phones
  environment.systemPackages = with pkgs; [
    jmtpfs
    libmtp
  ];
}
