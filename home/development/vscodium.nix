{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      # devsense.phptools-vscode
      bmewburn.vscode-intelephense-client
      jnoortheen.nix-ide
      vue.volar
      esbenp.prettier-vscode
      aaron-bond.better-comments
      ms-azuretools.vscode-docker
      dbaeumer.vscode-eslint
      formulahendry.auto-close-tag
      formulahendry.auto-rename-tag
      editorconfig.editorconfig
      arcticicestudio.nord-visual-studio-code
      eamodio.gitlens
      # pinage404.git-extension-pack
    ];
  };
}