{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vscode
    (jetbrains.plugins.addPlugins jetbrains.rider [
      "github-copilot"
      "gittoolbox"
      "key-promoter-x"
    ])
    (jetbrains.plugins.addPlugins jetbrains.webstorm [
      "github-copilot"
      "gittoolbox"
      "key-promoter-x"
    ])
    dotnetCorePackages.sdk_9_0-bin
  ];
}
