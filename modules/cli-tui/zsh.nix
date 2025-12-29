{ config, pkgs, ... }:

{
  # Enable zsh with built-in configuration
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "history" "fzf" ];
      theme = "robbyrussell";
    };

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # Optional: Add some aliases
    shellAliases = {
      ls = "eza";
      ll = "ls -l";
      la = "ls -la";
      cat = "bat";
      grep = "grep --color=auto";
    };
  };

  # Set zsh as default shell for user
  users.users.raksodiano.shell = pkgs.zsh;
  
  # Install additional tools
  environment.systemPackages = with pkgs; [
    starship  # Modern prompt
    fzf       # Fuzzy finder
    fd        # Better find (used by fzf)
    ripgrep   # Better grep (used by fzf)
  ];
}