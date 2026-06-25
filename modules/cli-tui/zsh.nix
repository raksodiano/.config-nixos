{ config, pkgs, ... }:

{
  # Enable zsh with built-in configuration
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "git-prompt"
        "gitignore"
        "gnu-utils"
        "sudo"
        "history"
        "fzf"
        "zsh-navigation-tools"
        "zsh-interactive-cd"
      ];
      theme = "gnzh";
    };

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    '';
  };

  # Set zsh as default shell for user
  users.users.raksodiano.shell = pkgs.zsh;
  
  # Install additional tools
  environment.systemPackages = with pkgs; [
    starship  # Modern prompt
  ];
}