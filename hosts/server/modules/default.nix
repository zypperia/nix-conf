{
  xdg.icons.enable = false;
  xdg.mime.enable = false;
  xdg.sounds.enable = false;

  imports = [
    ./boot.nix
    ./containers.nix
    ./networking.nix
    ./services.nix
    ./users.nix
    ./programs.nix
  ];
}
