{ lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  system.stateVersion = lib.mkForce "25.11";
}
