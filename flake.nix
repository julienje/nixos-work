{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-pinneda.url = "github:NixOS/nixpkgs/336eda0d07dc5e2be1f923990ad9fdb6bc8e28e3";
  };

  outputs = { self, nixpkgs, nixpkgs-pinneda, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
      system = "aarch64-linux";
      specialArgs = { 
        pkgs-pinneda = import nixpkgs-pinneda {
          inherit system;
          config.allowUnfree = true;
        };
       };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        ./i3.nix
        ./modules/packages.nix
        ./modules/graalvm.nix
        ./modules/custom.nix
      ];
    };
  };
}
