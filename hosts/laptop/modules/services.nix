{ config, pkgs, lib, ... }:

{
  services.qemuGuest.enable = true;

  services.openssh = {
    enable = false;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "yes";
    };
  };

  services.fail2ban = {
    enable = false;
    maxretry = 5;
    bantime = "52h";
  };

  #virtualisation.docker.enable = true;
}
