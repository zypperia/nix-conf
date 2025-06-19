{
  networking = {
    hostName = "server-00";
    
    dhcpcd.enable = true;
    hosts = {
      "127.0.0.1" = ["localhost" "server-00"];
    };
    
    firewall = {
      enable = true;
      allowedTCPPorts = [ 2222 ];
      allowedUDPPorts = [];
    };
  };
}
