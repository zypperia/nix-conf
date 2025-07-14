{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_hardened;
    loader.systemd-boot.enable = true;
  };

#  systemd.package = pkgs.systemd.override { withSelinux = true; };
}
