{ config, pkgs, lib, ... }:

{
  boot.loader = {
#    efi = {
#      canTouchEfiVariables = true;
#      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
#    };
    systemd-boot = {
      enable = true;
#      efiSupport = true;
#      efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
#      device = "/dev/vda";
    };
  };
}
