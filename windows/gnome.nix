# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  services = {
    xserver = {
      enable = true;
      excludePackages = with pkgs; [xterm];
      xkb = {
        layout = "ch";
        variant = "fr";
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      displayManager = {
        gdm.enable = true;
      }; 
    };
    displayManager = {
      autoLogin = {
        enable = true;
        user = "julien";
      };
    }; 
  };
  environment = {
    gnome = {
      excludePackages = with pkgs; [
        atomix
        cheese
        epiphany
        evince
        geary
        gnome-characters
        gnome-music
        gnome-photos
        gnome-tour
        hitori
        iagno
        tali
        totem
      ];
    };
    systemPackages = with pkgs; [
      gnome-tweaks
    ];
   };
}

