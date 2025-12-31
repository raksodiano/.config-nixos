{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./docker.nix
  ];

  # Tools that don't need configuration - just install them
  environment.systemPackages = with pkgs; [
    # Basic CLIs
    eza # Better ls
    zoxide # Better cd
    yazi # Better ranger
    bat # Better cat
    fd # Better find
    ripgrep-all # Better grep
    fzf # Fuzzy finder
    wget
    curl
    killall
    zip
    unzip
    jq
    rsync
    borgbackup
    coreutils
    ydotool
    gnupg
    age
    tree

    # Nix workflow
    nixd # Nix LSP
    nh # nix helper
    direnv
    devenv
    nix-output-monitor

    # Git tools
    lazygit # Git TUI

    # Networking tools
    nmap

    # NodeJS
    volta

    # Pass
    pwgen
    (pass-wayland.withExtensions (
      exts: with exts; [
        pass-otp
        pass-import
        pass-audit
      ]
    ))

    # System tools
    btop # Better top
    trash-cli # Safe rm
    tldr # Simplified man pages
    fastfetch # System info
  ];
}
