{
  description = "JohnnyB's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = {
    self,
    darwin,
    nixpkgs,
    nixos-wsl,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-darwin"];
  in {

    #####################################################
    # Dev Shell
    #####################################################

    devShells = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          alejandra
          nixd
          git
        ];
      };
    });

    #####################################################
    # NixOS Machines
    #####################################################

    nixosConfigurations.nixos-wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs outputs;};
      modules = [
        nixos-wsl.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        ./hosts/nixos-wsl
      ];
    };

    #####################################################
    # MacOS Machines
    #####################################################

    darwinConfigurations.mbp = darwin.lib.darwinSystem {
      specialArgs = {inherit inputs outputs;};
      modules = [
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-homebrew.darwinModules.nix-homebrew
        ./hosts/mbp
      ];
    };
  };
}
