{ pkgs, lib, ... }: let
  buildFirefoxXpiAddon = lib.makeOverridable ({ stdenv ? pkgs.stdenv
  , fetchurl ? pkgs.fetchurl, pname, version, addonId, url, hash, meta, ...
  }: stdenv.mkDerivation {
    name = "${pname}-${version}";

    inherit meta;

    src = fetchurl { inherit url hash; };

    preferLocalBuild = true;
    allowSubstitutes = true;

    passthru = { inherit addonId; };

    buildCommand = ''
      dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
      mkdir -p "$dst"
      install -v -m644 "$src" "$dst/${addonId}.xpi"
    '';
  });
in {
  what-font = buildFirefoxXpiAddon rec {
    pname = "zjm_whatfont";
    version = "1.3";
    addonId = "{dcb8caa2-63fa-41aa-a508-a45c5990ebdd}";
    url = "https://addons.mozilla.org/firefox/downloads/file/1748637/${pname}-${version}.xpi";
    hash = "sha256-897RdXGq/DqzLxAr4k1jl3EjNr/FJYRJLzoHuFZS4mY=";
    meta = {
      description = "A wrapper for Chengyin Liu's WhatFont tool";
      homepage = "https://github.com/chengyin/WhatFont-Bookmarklet";
      mozPermissions = [
        "https://*/*"
        "http://*/*"
      ];
      licenses = with lib.licenses; [ ncsa ];
      platforms = lib.platforms.all;
    };
  };
  wakatime = buildFirefoxXpiAddon rec {
    pname = "wakatimes";
    version = "3.0.22";
    addonId = "addons@wakatime.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4222179/${pname}-${version}.xpi";
    hash = "sha256-pk9sar2zkyKsJmaf5pjGZFd1jELOynEQ/AGa+qqvuSU=";
    meta = {
      description = "Automatic time tracking for Firefox.";
      homepage = "https://wakatime.com";
      licenses = with lib.licenses; [ mpl20 ];
      platforms = lib.platforms.all;
      mozPermissions = [
        "<all_urls>"
        "activeTabs"
        "tabs"
      ];
    };
  };
  stayfree = buildFirefoxXpiAddon rec {
    pname = "stayfree";
    version = "1.39.1";
    addonId = "{30b15d56-b2fa-4cb2-98fd-7b5e26306483}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4333471/${pname}-${version}.xpi";
    hash = "sha256-beDpyDmgLVqcSy5imy0ZvtsOsBb1QXkfCFssackfbZE=";
    meta = {
      homepage = "https://stayfreeapps.com";
      description = "Analytics to help you understand and control your website usage, leading to less distractions and enhanced productivity";
      mozPermissions = [];
      licenses = [ ];
      platforms = lib.platforms.all;
    };
  };
  firefox-relay = buildFirefoxXpiAddon rec {
    pname = "private_relay";
    version = "2.8.1";
    addonId = "private-relay@firefox.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4205650/${pname}-${version}.xpi";
    hash = "sha256-SoXdwc0Z0qFWxO/nYiXUJMDDLnAKt3YB+MHlDXl1zZ0=";
    meta = {
      homepage = "https://relay.firefox.com/";
      description = "Firefox Relay lets you generate email aliases that forward to your real inbox. Use it to hide your real email address and protect yourself from hackers and unwanted mail.";
      mozPermissions = [
        "<all_urls>"
      ];
      licenses = with lib.licenses; [ mpl20 ];
      platforms = lib.platforms.all;
    };
  };
  preact-devtools = buildFirefoxXpiAddon rec {
    pname = "preact_devtools";
    version = "4.7.2";
    addonId = "devtools@marvinh.dev";
    url = "https://addons.mozilla.org/firefox/downloads/file/4269987/${pname}-${version}.xpi";
    hash = "sha256-iMalYgJGvZZfu7LhpMLjLT4rZRSHQ0v69E9ofxLDtK0=";
    meta = {
      homepage = "https://github.com/preactjs/preact-devtools";
      description = "Only works with Preact 10.1.0 upwards\n\nDebugging tools for Preact. This extension allows you to inspect the component hierarchy and change properties on the fly.";
      mozPermissions = [];
      licenses = with lib.licenses; [ mit ];
      platforms = lib.platforms.all;
    };
  };
}
