{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.darwin.follows = "";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

#    nur = {
#      url = "github:nix-community/NUR";
#      inputs.nixpkgs.follows = "nixpkgs-unstable";
#    };

  };
  outputs = { self, nixpkgs-stable, nixpkgs-unstable, nixos-wsl, home-manager, agenix }: {
  
    nixosConfigurations.laptop = nixpkgs-unstable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./global.nix
        ./hosts/laptop/modules
        agenix.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = import ./hosts/laptop/home.nix;
        }
      ];
    };
    
    nixosConfigurations.wsl = nixpkgs-unstable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./global.nix
        ./hosts/wsl/wsl.nix
        agenix.nixosModules.default
        nixos-wsl.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = import ./hosts/wsl/home.nix;
        }
      ];
    };

    nixosConfigurations.generic = nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [];
    };
  };
}
