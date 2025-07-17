{
  xdg.icons.enable = false;
  xdg.mime.enable = false;
  xdg.sounds.enable = false;
  environment.defaultPackages = [];

  nixpkgs.config.allowUnfree = true; # For fuck'd NVIDIA drivers

  system.stateVersion = "25.05";

  imports = [
    ./boot.nix
    ./containers.nix
    ./networking.nix
    ./services.nix
    ./users.nix
    ./programs.nix
  ];
}
