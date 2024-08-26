{ pkgs, lib, ... }: let
  buildFirefoxXpiAddon = import ./buildFirefoxXpiAddon.nix { inherit pkgs lib; };
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
  allow-right-click = buildFirefoxXpiAddon rec {
    pname = "re_enable_right_click";
    version = "5.6.2";
    addonId = "{278b0ae0-da9d-4cc6-be81-5aa7f3202672}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4300505/${pname}-0.${version}.xpi";
    hash = "sha256-yUii5G1y0n0DMjqksqntiO6wDIPITUv3kGOoVO07qgA=";
    meta = {
      homepage = "https://webextension.org/listing/allow-right-click.html";
      description = "Re-enable the possibility to use the context menu, copy, paste, and text selection on sites that prevent them";
      mozPermissions = [
        "storage"
        "activeTab"
        "contextMenus"
        "notifications"
        "webNavigation"
        "*://*/*"
      ];
      licenses = [];
      platforms = lib.platforms.all;
    };
  };
  firefoxpwa = buildFirefoxXpiAddon rec {
    pname = "pwas_for_firefox";
    version = "2.12.1";
    addonId = "firefoxpwa@filips.si";
    url = "https://addons.mozilla.org/firefox/downloads/file/4293028/${pname}-${version}.xpi";
    hash = "sha256-m8BCAlQt37RxVnWw+2hIPnmofTicNa5OWkwXp/IXdWY=";
    meta = {
      homepage = "https://pwasforfirefox.filips.si/";
      description = "A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox";
      mozPermissions = [
        "nativeMessaging"
        "notifications"
        "storage"
        "http://*/*"
        "https://*/*"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
      ];
      licenses = [];
      platforms = lib.platforms.all;
    };
  };
  xdm = buildFirefoxXpiAddon rec {
    pname = "xdm_integration_module";
    version = "1.3";
    addonId = "xdm-integration-module@subhra74.github.io";
    url = "https://addons.mozilla.org/firefox/downloads/file/4044567/${pname}-${version}.xpi";
    hash = "sha256-zdk/npeagq4vTPHsFlQI+yqvV1li16QaL7rLRiRDK24=";
    meta = {
      homepage = "";
      description = "Download files with XDM application";
      mozPermissions = [
        "nativeMessaging"
        "cookies"
        "downloads"
        "tabs"
        "webRequest"
        "<all_urls>"
      ];
      licenses = [];
      platforms = lib.platforms.all;
    };
  };
  xdm_v8 = buildFirefoxXpiAddon rec {
    pname = "xdm_browser_monitor_v8";
    version = "3.4";
    addonId = "xdm-v8-browser-helper@subhra74.github.io";
    url = "https://addons.mozilla.org/firefox/downloads/file/4095144/${pname}-${version}.xpi";
    hash = "sha256-+3A6wX3COWADiahpU/v2PfbTEoCndFFHwRy6ky0WV8k=";
    meta = {
      homepage = "";
      description = "Download files with XDM v8+";
      mozPermissions = [
        "tabs"
        "cookies"
        "contextMenus"
        "menus"
        "activeTab"
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
      ];
      licenses = [];
      platforms = lib.platforms.all;
    };
  };
}
