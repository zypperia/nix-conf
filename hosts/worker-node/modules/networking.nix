{
  networking = {
    hostName = "worker-node";

    dhcpcd.enable = true;
    /*hosts = {
      "127.0.0.1" = ["localhost" "worker-node"];
      "100.75.70.58" = ["master-node"];
    };*/

    nftables.enable = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [ 80 22 ];
      allowedUDPPorts = [];
      checkReversePath = false;

    };
  };
}
