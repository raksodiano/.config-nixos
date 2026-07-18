{
  config,
  pkgs,
  lib,
  ...
}:

let
  bravePrefsFile = "${config.home.homeDirectory}/.config/BraveSoftware/Brave-Browser/Default/Preferences";
in
{
  programs.brave = {
    enable = true;

    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
      "bhhldhbndhijheajpkbjhdadjpimahda" # Decentraleyes
    ];
  };

  # Vertical tabs enabled in Brave profile
  home.activation.setBraveVerticalTabs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -f "${bravePrefsFile}" ]; then
      ${pkgs.jq}/bin/jq '.brave.tabs.vertical_tabs_enabled = true' "${bravePrefsFile}" > "${bravePrefsFile}.tmp" \
        && mv "${bravePrefsFile}.tmp" "${bravePrefsFile}"
    fi
  '';
}
