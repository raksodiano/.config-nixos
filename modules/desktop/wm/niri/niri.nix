{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.niri ];

  security.polkit.enable = true;
  hardware.opengl.enable = true;
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${pkgs.niri}/bin/niri-session";
  };
}
