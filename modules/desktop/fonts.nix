{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      alegreya
      alegreya-sans
      # New nerd-fonts namespace
      nerd-fonts._3270
      nerd-fonts.hack
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.iosevka-term-slab
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.geist-mono
      montserrat
    ];

    # Font configuration
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Alegreya" ];
        sansSerif = [ "Montserrat" ];
        monospace = [ "GeistMono Nerd Font" ];
      };
    };
  };
}