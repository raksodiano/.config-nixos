{ config, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages =
      epkgs: with epkgs; [
        pdf-tools
        vterm
        org-roam
        treesit-grammars.with-all-grammars
        mu4e
      ];
  };

  # Add the systemd user service
  systemd.user.services.emacs = {
    Unit = {
      Description = "Emacs daemon";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${config.programs.emacs.finalPackage}/bin/emacs --daemon";
      ExecStop = "${config.programs.emacs.finalPackage}/bin/emacsclient -e '(kill-emacs)'";
      Restart = "on-failure";

      Environment = [
        "PATH=${config.home.profileDirectory}/bin:/run/current-system/sw/bin"
      ];
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };

  # Add Doom to PATH
  home.sessionPath = [ "${config.home.homeDirectory}/.config/emacs/bin" ];

  # Environment variables for Doom
  home.sessionVariables = {
    DOOMDIR = "${config.home.homeDirectory}/.config/doom";
    DOOMLOCALDIR = "${config.home.homeDirectory}/.local/share/doom";
  };
}
