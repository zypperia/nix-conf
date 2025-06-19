{
#  catppuccin.flavor = "mocha";
#  catppuccin.enable = true;

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
