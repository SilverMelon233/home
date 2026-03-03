{
  description = "Home Manager configuration of ytr";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal.url = "github:aylur/astal";

    ags.url = "github:aylur/ags";

    matshell.url = "github:Neurarian/matshell";
    # hyprland.url = "github:hyprwm/Hyprland/v0.53.0";
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins/v0.53.0";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # hyprgrass = {
    #   url = "github:horriblename/hyprgrass";
    #   inputs.hyprland.follows = "hyprland";
    # };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ inputs.nix-vscode-extensions.overlays.default ];
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
          inherit inputs;
        };
        modules = [
          ./home.nix
        ];
      };
    };
}
