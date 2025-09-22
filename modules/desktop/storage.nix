{ config, pkgs, ... }:

{
 # Enable automatic mounting of USB drives
  services.udisks2.enable = true;

  # Enable GVFS for desktop integration
  services.gvfs.enable = true;

  # Force start udisks2
  systemd.services.udisks2 = {
    wantedBy = [ "graphical-session.target" ];
  };

  # Additional packages for USB/storage management
  environment.systemPackages = with pkgs; [
    # File manager integration
    gvfs          # GNOME Virtual File System
    udisks2       # Disk management service

    # Disk management tools
    gnome-disk-utility  # Disk utility GUI with image writing

    # Command line tools
    dd_rescue     # Better dd with error recovery
    pv            # Progress viewer for dd operations
  ];
}