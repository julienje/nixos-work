{ lib, config, pkgs, ... }:

{
  home.username = "julien";
  home.homeDirectory = "/home/julien";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Julien Jeanneret";
    userEmail = "julien.jeanneret@outlook.com";
  };

  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      # see https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
      userSettings = {
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 100;
        "git.autofetch" = true;
      };

      # maybe someday with pkgs.vscode-marketplace
      extensions = with pkgs.vscode-extensions; [
        # Search for vscode-extensions on https://search.nixos.org/packages
        jnoortheen.nix-ide
        github.copilot-chat
        github.copilot
        github.vscode-pull-request-github
      ];
    };
  };

  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
    };
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 0;
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
        "brave-browser.desktop"
        "chromium-browser.desktop"
        "code.desktop"
        ];
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
