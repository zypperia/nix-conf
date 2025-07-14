{ pkgs, ... }:

{
  boot = {
#    kernelPackages = pkgs.linuxPackages_hardened;
    loader.systemd-boot.enable = true;
    supportedFilesystems = [ "bcachefs" ];
  };

#  systemd.package = pkgs.systemd.override { withSelinux = true; };
}
