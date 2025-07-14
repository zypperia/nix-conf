{ config, pkgs, lib, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
    supportedFilesystems = [ "bcachefs" ];
  };

  networking.hostName = "iso";

  users.extraUsers.root.password = "";
}
