{ pkgs, ... }:

{
#  nix.package = pkgs.lix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config = {
    allowUnfree = true;
    cudaSupport = true;
  };

  time.timeZone = "Asia/Krasnoyarsk";

  hardware.graphics.enable = true;

  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  documentation.man.enable = false;
}
