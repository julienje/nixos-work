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
        enable = false;
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
        gnome-calculator
        gnome-calendar
        gnome-characters
        gnome-contacts
        gnome-maps
        gnome-music
        gnome-photos
        gnome-text-editor
        gnome-tour
        gnome-weather
        hitori
        iagno
        simple-scan
        snapshot
        tali
        totem
      ];
    };
    systemPackages = with pkgs; [
      gnome-tweaks
    ];
   };
}