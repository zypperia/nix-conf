{ config, pkgs, lib, ... }:

{
  networking = {
    hostName = "vps";
    
    dhcpcd.enable = true;
    hosts = {
      "127.0.0.1" = ["localhost" "vps"];
    };
    
    firewall = {
      enable = true;
      allowedTCPPorts = [ 2222 ];
      allowedUDPPorts = [];
    };
  };
}
