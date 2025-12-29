{ config, pkgs, ... }:

{
  # Install Emacs and Doom dependencies at system level
  environment.systemPackages = with pkgs; [
    # Python tools
    black
    isort
    pipenv

    # Go tools
    gomodifytags
    gore
    gotests

    # Web development
    html-tidy
    js-beautify
    nodejs
    stylelint

    # System utilities
    curl
    fd
    git
    git-crypt
    ripgrep
    wget
    wmctrl
    xclip
    xdotool
    xorg.xprop
    xorg.xwininfo

    # Emacs dependencies
    emacs-all-the-icons-fonts
    graphviz
    hunspell
    hunspellDicts.en_US
    hunspellDicts.es_ES
    hugo
    imagemagick
    maim
    sqlite
    vips

    # Language runtimes
    php
    sbcl

    # Formatting and linting
    dockfmt
    nixfmt
    shellcheck
    shfmt

    # LaTeX support
    texlive.combined.scheme-full
  ];
}
