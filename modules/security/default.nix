{ config, pkgs, ... }:

{
  imports = [
    ./keychain.nix
  ];

  # Basic security hardening
  security = {
    sudo.wheelNeedsPassword = true;

    # Disable root login
    sudo.enable = true;
  };

  # enable mosh
  programs.mosh.enable = true;

  # Tailscale service
  # services.tailscale.enable = false;
  # networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  # networking.firewall.allowPing = true;

  # SSH hardening
  services.openssh = {
    enable = true;
    # settings = {
    #   PasswordAuthentication = false;
    #   PermitRootLogin = "no";
    #   Protocol = 2;
    # };
  };

  # Firewall
  networking.firewall.enable = true;

  # Security packages
  environment.systemPackages = with pkgs; [
    fail2ban
    gnupg
    age
  ];
}