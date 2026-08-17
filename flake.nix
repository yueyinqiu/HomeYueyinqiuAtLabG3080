{
  inputs = {    
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs-master = {
      url = "github:NixOS/nixpkgs/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      vscode-server,
      nur,
      ...
    }:
    {
      homeConfigurations."yueyinqiu@lab-g3080-nix" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          vscode-server = vscode-server;
          nur = nur.legacyPackages."x86_64-linux".repos;
        };
        modules = [
          ./src
        ];
      };
    };
}
