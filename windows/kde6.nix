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
    };
    displayManager = {
      sddm =  {
        enable = true;
        wayland.enable = true;
        settings.General.DisplayServer = "wayland";
      };
      autoLogin = {
        enable = true;
        user = "julien";
      };
    }; 
    desktopManager = {
        plasma6 = {
          enable = true;
        };
    };
  };
}

