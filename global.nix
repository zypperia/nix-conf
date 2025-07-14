{ pkgs, ... }:

{
#  nix.package = pkgs.lix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

  time.timeZone = "Asia/Krasnoyarsk";

  hardware.graphics.enable = true;

#  system.autoUpgrade = {
#    enable = true;
#    flake = inputs.self.outPath;
#    flags = [
#      "--update-input"
#      "nixpkgs-unstable"
#      "-L"
#    ];
#    dates = "00:00";
#  };

  documentation.man.enable = false;
}
