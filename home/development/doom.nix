{ config, pkgs, lib, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages =
      epkgs: with epkgs; [
        vterm
        pdf-tools
      ];
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    git
    emacs-all-the-icons-fonts
    aspell
    aspellDicts.en
    aspellDicts.es
    graphviz
    sqlite
    imagemagick
    ghostscript
    vips
    shellcheck
    shfmt
    wmctrl
  ];

  systemd.user.services.emacs = {
    Unit = {
      Description = "Emacs daemon";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
      Requires = [ "graphical-session.target" ];
    };
    Service = {
      Type = "notify";
      ExecStart = "${config.programs.emacs.finalPackage}/bin/emacs --fg-daemon";
      ExecStop = "${config.programs.emacs.finalPackage}/bin/emacsclient --eval '(kill-emacs)'";
      Restart = "on-failure";
      PassEnvironment = [
        "WAYLAND_DISPLAY"
        "XDG_RUNTIME_DIR"
        "DISPLAY"
      ];
      Environment = [
        "PATH=${config.home.profileDirectory}/bin:/run/current-system/sw/bin"
        "GDK_BACKEND=wayland"
      ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  home.sessionPath = [ "${config.home.homeDirectory}/.emacs.d/bin" ];

  home.sessionVariables = {
    EDITOR = "emacsclient -nw";
    VISUAL = "emacsclient -nw";
    DOOMDIR = "${config.home.homeDirectory}/.config/doom";
    DOOMLOCALDIR = "${config.home.homeDirectory}/.local/share/doom";
  };

  home.activation.installDoomEmacs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ -L "$HOME/.emacs.d" ]; then
      rm -f "$HOME/.emacs.d"
    fi
    if [ ! -d "$HOME/.emacs.d" ]; then
      echo "installDoomEmacs: cloning Doom Emacs..."
      ${pkgs.git}/bin/git clone --depth 1 https://github.com/doomemacs/doomemacs "$HOME/.emacs.d"
    fi
    if [ -d "$HOME/.emacs.d" ]; then
      echo "installDoomEmacs: initializing modules submodule..."
      ${pkgs.git}/bin/git -C "$HOME/.emacs.d" submodule update --init sources/doom+
      echo "installDoomEmacs: Run 'doom sync && doom env' manually after rebuild"
    fi
  '';
}
