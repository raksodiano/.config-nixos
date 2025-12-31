{ config, pkgs, ... }:

let
  # Create a function to make out-of-store symlinks
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configDir = "${config.home.homeDirectory}/.config-nixos/dotfiles";
in
{
  home.file = {
    ".config/alacritty".source = mkOutOfStoreSymlink "${configDir}/alacritty";
    ".config/bat".source = mkOutOfStoreSymlink "${configDir}/bat";
    ".config/doom".source = mkOutOfStoreSymlink "${configDir}/doom";
    ".config/fastfetch".source = mkOutOfStoreSymlink "${configDir}/fastfetch";
    ".config/hypr".source = mkOutOfStoreSymlink "${configDir}/hypr";
    ".config/kitty".source = mkOutOfStoreSymlink "${configDir}/kitty";
    ".config/niri".source = mkOutOfStoreSymlink "${configDir}/niri";
    ".config/noctalia".source = mkOutOfStoreSymlink "${configDir}/noctalia";
    ".config/rmpc".source = mkOutOfStoreSymlink "${configDir}/rmpc";
    ".config/starship.toml".source = mkOutOfStoreSymlink "${configDir}/starship/starship.toml";
    ".config/swaync".source = mkOutOfStoreSymlink "${configDir}/swaync";
    ".config/waybar".source = mkOutOfStoreSymlink "${configDir}/waybar";
    ".config/wofi".source = mkOutOfStoreSymlink "${configDir}/wofi";
    ".config/tmux".source = mkOutOfStoreSymlink "${configDir}/tmux";
    ".tridactylrc".source = mkOutOfStoreSymlink "${configDir}/tridactyl/tridactylrc";
    ".config/yt-dlp".source = mkOutOfStoreSymlink "${configDir}/yt-dlp";
    ".config/zathura".source = mkOutOfStoreSymlink "${configDir}/zathura";
    ".zshrc".source = mkOutOfStoreSymlink "${configDir}/zsh/.zshrc";
  };
}
