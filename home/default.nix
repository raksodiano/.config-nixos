{ config, pkgs, ... }:

let
  # Create a function to make out-of-store symlinks
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  imports = [
    ./development/doom.nix
    ./development/vscodium.nix
    ./browsers/firefox.nix
  ];

  home.username = "raksodiano";
  home.homeDirectory = "/home/raksodiano";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  systemd.user.startServices = true;

  home.packages = with pkgs; [

  ];

  programs.zsh.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 1800;
  };

  home.file = {
    ".config/doom".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.config-nixos/dotfiles/doom";
    ".zshrc".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.config-nixos/dotfiles/zsh/.zshrc";
    ".config/starship.toml".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.config-nixos/dotfiles/starship/starship.toml";
    ".config/fastfetch".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.config-nixos/dotfiles/fastfetch";
  };
}
