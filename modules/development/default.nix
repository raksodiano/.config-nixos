{ config, pkgs, ... }:

{
  imports = [
    ./doom.nix
    ./godot.nix
  ];

  # CLI/TUI tools
  environment.systemPackages = with pkgs; [
    # Editor
    vscodium
    antigravity

    # ApiRest test
    insomnia

    # Go toolchain
    go
    gopls
    godef
    gotools

    gcc
    gh
    delta
    glibc
    clang
    cmake
    libtool
    gnumake
    sdbus-cpp
    keychain

    # Rust related
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy

    # Python
    python3
    python3Packages.pip
    python3Packages.virtualenv

    # Plotting
    gnuplot

    # Spell checking
    aspell
    aspellDicts.en
    aspellDicts.es
  ];
}
