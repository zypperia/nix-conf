{
  networking = {
    hostName = "master-node";

    dhcpcd.enable = true;
    hosts = {
      "127.0.0.1" = ["localhost" "master-node"];
      "100.75.70.58" = ["master-node"]
    };

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
