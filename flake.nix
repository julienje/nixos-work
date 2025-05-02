{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-pinneda.url = "github:NixOS/nixpkgs/336eda0d07dc5e2be1f923990ad9fdb6bc8e28e3";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, nixpkgs-pinneda, ... }@inputs: {

    nixosConfigurations.vm-sbb = nixpkgs.lib.nixosSystem rec {
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
        ./hosts/vm-sbb
      ];
    };

    nixosConfigurations.vm-perso = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./hosts/vm-perso

        home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jdoe = ./home/home-perso.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }

      ];
    };
  };
}
