{ pkgs, ... }:

{
  programs.niri.enable = true;
  environment.systemPackages = [ pkgs.niri ];

  security.polkit.enable = true;
  hardware.graphics.enable = true;
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "*";
  };

  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --cmd ${pkgs.niri}/bin/niri-session";
  };
}
