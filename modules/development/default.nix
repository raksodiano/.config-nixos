{ config, pkgs, ... }:

{
  imports = [
    ./doom.nix
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
  ];
}
