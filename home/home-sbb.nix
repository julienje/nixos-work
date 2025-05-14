{ lib, config, pkgs, ... }:

{
  home.username = "julien";
  home.homeDirectory = "/home/julien";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "u231154";
    userEmail = "julien.jeanneret2@sbb.ch";
  };

  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = true;
    };
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 0;
    };
    "org/gnome/shell/session" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
        "brave-browser.desktop"
        "chromium-browser.desktop"
        "idea-ultimate.desktop"
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
