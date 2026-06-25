{ config, pkgs, ... }:

{
  # System-level browser installations
  environment.systemPackages = with pkgs; [
    brave
    google-chrome
    librewolf
  ];

  # Firefox with extensions via home-manager approach
  programs.firefox = {
    enable = true;

    # System-wide policies
    policies = {
      # Disable telemetry
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;

      # Security settings
      BlockAboutConfig = false;
      OfferToSaveLogins = false;

      SearchEngines.Default = "DuckDuckGo";
    };
  };

  # Brave & Chromium-based browser policies
  programs.chromium = {
    enable = true;
    extraOpts = {
      "BraveRewardsDisabled" = true;
      "BraveWalletDisabled" = true;
      "BraveVPNDisabled" = true;
      "BraveAIChatEnabled" = false;
      "PasswordManagerEnabled" = false;
      "MetricsReportingEnabled" = false;
      "SyncDisabled" = true;

      "DefaultSearchProviderEnabled" = true;
      "DefaultSearchProviderName" = "DuckDuckGo";
      "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
    };
  };
}