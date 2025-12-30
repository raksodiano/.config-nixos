{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.noctalia.shell;
in
{
  options.noctalia.shell = {
    enable = lib.mkEnableOption "Noctalia Shell";

    package = lib.mkOption {
      type = lib.types.package;
      description = "Paquete de Noctalia";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      brightnessctl
      pamixer
      playerctl
      ddcutil
      polkit_gnome
      cfg.package
    ];

    systemd.user.services.noctalia = {
      description = "Noctalia Shell";
      wantedBy = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${cfg.package}/bin/noctalia --compositor niri";
        Restart = "on-failure";
      };
    };

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      font-awesome
      nerd-fonts.jetbrains-mono
    ];

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    services.dbus.enable = true;
    programs.dconf.enable = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
