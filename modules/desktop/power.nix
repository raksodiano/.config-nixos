{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Disable conflicting power management
  services.power-profiles-daemon.enable = true;

  # Core power management
  services = {
    # Essential power monitoring
    upower = {
      enable = true;
      percentageLow = 15;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "Hibernate";
    };

    # Thermal management
    thermald.enable = true;

    # Firmware updates
    fwupd.enable = true;
  };

  # Essential tools
  environment.systemPackages = with pkgs; [
    powertop
    acpi
    lm_sensors
  ];

  # Basic power management
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
}
