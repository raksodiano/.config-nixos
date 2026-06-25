{ config, pkgs, ... }:

let
  # Create a function to make out-of-store symlinks
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configDir = "${config.home.homeDirectory}/.config-nixos/dotfiles";
in
{
  home.file = {
    ".config/doom".source = mkOutOfStoreSymlink "${configDir}/doom/.config/doom";
    ".config/fastfetch".source = mkOutOfStoreSymlink "${configDir}/fastfetch/.config/fastfetch";
    ".config/kitty".source = mkOutOfStoreSymlink "${configDir}/kitty/.config/kitty";
    ".config/starship.toml".source = mkOutOfStoreSymlink "${configDir}/starship/.config/starship.toml";
    ".tridactylrc".source = mkOutOfStoreSymlink "${configDir}/tridactyl/.config/tridactyl/tridactylrc";
    ".config/yt-dlp".source = mkOutOfStoreSymlink "${configDir}/yt-dlp/.config/yt-dlp";
    ".config/zathura".source = mkOutOfStoreSymlink "${configDir}/zathura/.config/zathura";
    ".zshrc".source = mkOutOfStoreSymlink "${configDir}/zsh/.zshrc";
  };
}
