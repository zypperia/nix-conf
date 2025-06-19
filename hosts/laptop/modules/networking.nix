{ config, pkgs, lib, ... }:

{
  networking = {
    hostName = "laptop-00";
    
    dhcpcd.enable = true;
    hosts = {
      "127.0.0.1" = ["localhost" "laptop-00"];
    };
    
    firewall = {
      enable = true;
      allowedTCPPorts = [ 2222 ];
      allowedUDPPorts = [];
    };
  };
}
