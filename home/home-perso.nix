{ config, pkgs, ... }:

{
  home.username = "julien";
  home.homeDirectory = "/home/julien";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Julien Jeanneret;
    userEmail = "julien.jeanneret@outlook.com";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.056";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}