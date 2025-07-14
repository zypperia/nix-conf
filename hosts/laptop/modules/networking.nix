{
  networking = {
    hostName = "laptop-00";

    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

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
