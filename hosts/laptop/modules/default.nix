{
#  catppuccin.flavor = "mocha";
#  catppuccin.enable = true;

#  xdg.icons.enable  = false;
#  xdg.mime.enable   = false;
#  xdg.sounds.enable = false;

  system.stateVersion = "25.11";

  imports = [
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./users.nix
    ./programs.nix
    ./security.nix
  ];
}
