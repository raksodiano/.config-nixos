{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;

    profiles.default = {
      name = "Default";
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        tridactyl
        don-t-fuck-with-paste
        decentraleyes
        privacy-badger
        istilldontcareaboutcookies
        violentmonkey
        wayback-machine
        leechblock-ng
        kristofferhagen-nord-theme
      ];

      settings = {
        # Privacy settings
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.donottrackheader.enabled" = true;

        # Disable telemetry
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.enabled" = false;

        # Security
        "dom.security.https_only_mode" = true;
        "security.tls.insecure_fallback_hosts" = "";

        # Disable autoplay
        "media.autoplay.default" = 5;

        # Performance
        "browser.cache.disk.enable" = false;
        "browser.sessionstore.privacy_level" = 2;

        # File picker nativo (GNOME/KDE)
        "widget.use-xdg-desktop-portal.file-picker" = 1;

        # DuckDuckGo como buscador predeterminado
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.order.1" = "DuckDuckGo";

        # Aceleración GPU
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "layers.acceleration.force-enabled" = true;

        # Legacy userChrome/userContent
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Sidebar vertical nativo
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
      };

      # Custom userChrome.css with Nord theme
      userChrome = ''
        /* Nord color scheme for LibreWolf UI */
        :root {
          --nord0: #2e3440;
          --nord1: #3b4252;
          --nord2: #434c5e;
          --nord3: #4c566a;
          --nord4: #d8dee9;
          --nord5: #e5e9f0;
          --nord6: #eceff4;
          --nord7: #8fbcbb;
          --nord8: #88c0d0;
          --nord9: #81a1c1;
          --nord10: #5e81ac;
        }

        /* Apply Nord colors to browser chrome */
        #navigator-toolbox {
          background-color: var(--nord1) !important;
        }

        #urlbar {
          background-color: var(--nord2) !important;
          color: var(--nord6) !important;
        }
      '';

      # Updated bookmarks syntax
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "NixOS Manual";
                url = "https://nixos.org/manual/nixos/stable/";
              }
            ];
          }
        ];
      };
    };
  };
}
