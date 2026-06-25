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
    git-crypt
    wmctrl
    xclip
    xdotool
    xprop
    xwininfo

    # Emacs dependencies (system-level, not duplicated in home.packages)
    hunspell
    hunspellDicts.en_US
    hunspellDicts.es_ES
    hunspellDicts.es_CO
    hugo

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
