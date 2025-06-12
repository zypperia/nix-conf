{ lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Krasnoyarsk"

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

  system.stateVersion = lib.mkForce "25.11";
}
