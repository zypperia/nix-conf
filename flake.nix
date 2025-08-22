{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    #catppuccin.url = "github:catppuccin/nix";
    #microvm.url = "github:astro/microvm.nix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
          url = "github:nix-community/stylix";
          inputs.nixpkgs.follows = "nixpkgs";
        };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

  };
  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, nixos-wsl, home-manager, agenix, zen-browser, stylix }: { # catppuccin,  microvm }: {
    nixosConfigurations = {
      laptop = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          ./global.nix
          ./hosts/laptop/modules
          ./hosts/laptop/hardware.nix
          #stylix.nixosModules.stylix
          agenix.nixosModules.default
  #        catppuccin.nixosModules.catppuccin

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zypperia = {
              imports = [
                stylix.homeModules.stylix
                inputs.zen-browser.homeModules.beta
                ./hosts/laptop/home.nix
              ];
            };
  #          home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };

      wsl = nixpkgs-unstable.lib.nixosSystem {
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

      server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./global.nix
          ./hosts/server/modules
          ./hosts/server/hardware.nix
          agenix.nixosModules.default
        ];
      };

      master-node = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./global.nix
          ./hosts/master-node/modules
          ./hosts/master-node/hardware.nix
          agenix.nixosModules.default
        ];
      };

      worker-node = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./global.nix
          ./hosts/worker-node/modules
          ./hosts/worker-node/hardware.nix
          agenix.nixosModules.default
        ];
      };

      nixosConfigurations.iso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./global.nix
          ./hosts/iso
        ];
      };
    };
  };
}
