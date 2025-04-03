# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "ch";
        variant = "fr";
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3status
          dmenu
          rofi
        ];
      };
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
    };
    displayManager = {
      defaultSession = "xfce+i3";
      autoLogin = {
        enable = true;
        user = "julien";
      };
    };
  };
}

