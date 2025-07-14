{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    catppuccin.url = "github:catppuccin/nix";
    microvm.url = "github:astro/microvm.nix";

#    sops-nix.url = "github:Mic92/sops-nix";

#    zen-browser.url = "github:MarceColl/zen-browser-flake";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs-stable";
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
  outputs = { self, nixpkgs-stable, nixpkgs-unstable, nixos-wsl, home-manager, agenix, catppuccin, microvm, ... } @ inputs: {
  
    nixosConfigurations.laptop = nixpkgs-unstable.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        ./global.nix
        ./hosts/laptop/modules
        ./hosts/laptop/hardware.nix
        agenix.nixosModules.default

        catppuccin.nixosModules.catppuccin

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.zypperia = {
            imports = [
              catppuccin.homeModules.catppuccin
              ./hosts/laptop/home.nix
            ];
          };
          home-manager.extraSpecialArgs = { inherit inputs; };
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

    nixosConfigurations.server = nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./global.nix
        ./hosts/server/modules
        ./hosts/server/hardware.nix
        agenix.nixosModules.default
#        microvm.nixosModules.microvm
#        {
#          networking.hostName = "my-microvm";
#          microvm.hypervisor = "cloud-hypervisor";
#        }
      ];
    };

    
    nixosConfigurations.iso = nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./global.nix
        ./hosts/iso
      ]
    };
  };
}
