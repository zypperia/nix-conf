{
#  catppuccin.flavor = "mocha";
#  catppuccin.enable = true;

#  xdg.icons.enable  = false;
#  xdg.mime.enable   = false;
#  xdg.sounds.enable = false;

  imports = [
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./timers.nix
    ./users.nix
    ./programs.nix
    ./security.nix
  ];
}
