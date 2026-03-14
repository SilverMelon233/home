{
  description = "Home Manager configuration of ytr";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        overlays = [ inputs.nix-vscode-extensions.overlays.default ];
        config.allowUnfree = true;
      };
      userConfig = import ./user-config.nix {
        inherit pkgs;
      };
    in
    {
      homeConfigurations."ytr" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit userConfig;
          inherit pkgs-unstable;
          inherit inputs;
        };
        modules = [
          ./home.nix
        ];
      };
    };
}
