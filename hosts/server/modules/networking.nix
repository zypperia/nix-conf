{
  networking = {
    hostName = "server-00";
    
    dhcpcd.enable = true;
    hosts = {
      "127.0.0.1" = ["localhost" "server-00"];
    };

    nftables.enable = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [ 80 22 ];
      allowedUDPPorts = [];
#      checkReversePath = false;
    };
  };
}
