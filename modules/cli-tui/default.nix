{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./docker.nix
  ];

  # Tools that don't need configuration - just install them
  # nix-ld: allows running precompiled non-Nix binaries on NixOS
  # Required for "volta install pnpm" and similar tools to work
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Base libraries plus dependencies for volta binaries
      stdenv.cc.cc
      openssl
      curl
      zlib
      zstd
      attr
      libssh
      bzip2
      libxml2
      acl
      libsodium
      util-linux
      xz
      systemd
    ];
  };

  environment.systemPackages = with pkgs; [
    # Basic CLIs
    eza # Better ls
    zoxide # Better cd

    fd # Better find
    ripgrep-all # Better grep
    fzf # Fuzzy finder
    wget
    curl
    killall
    zip
    unzip
    p7zip
    unrar
    jq
    rsync
    borgbackup
    coreutils
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
    bat # Better cat
    fastfetch # System info
    figlet
    sl

    # Disk utilities
    dd_rescue # Better dd with error recovery
    pv # Progress viewer for dd operations
  ];
}
