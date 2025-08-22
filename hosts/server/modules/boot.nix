{ config, pkgs, lib, ... }:

{
  boot = {
#    kernelPackages = pkgs.linuxPackages_hardened;
    loader.systemd-boot.enable = true;
    supportedFilesystems = [ "bcachefs" ];
  };
}
