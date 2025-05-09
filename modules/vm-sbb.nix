{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vscode
    maven
    #jetbrains.idea-ultimate
    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [
      "github-copilot"
      "gittoolbox"
      "key-promoter-x"
    ])
    jetbrains-toolbox
    nodejs_22
  ];
}
