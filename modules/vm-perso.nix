{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vscode
    jetbrains.rider
    jetbrains.webstorm
    dotnetCorePackages.sdk_9_0-bin
  ];
}
