{
  networking = {
    hostName = "master-node";

    dhcpcd.enable = true;
    /*hosts = {
      "127.0.0.1" = ["localhost"];
    };*/

    nftables.enable = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [ 80 22 ];
      allowedUDPPorts = [];
      # allowPing = false;
      checkReversePath = false;

    };
  };
}
