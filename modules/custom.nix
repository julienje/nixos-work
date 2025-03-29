{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.jetbrains.rider
    pkgs.jetbrains.webstorm
    pkgs.dotnetCorePackages.sdk_9_0-bin
  ];
}
