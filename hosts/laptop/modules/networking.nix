{
  networking = {
    hostName = "laptop";

    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

    #nat.enable = true;
    #nat.externalInterface = "wlo1";
    #nat.internalInterfaces = [ "wg0" ];


    wg-quick = {
      #enable = true;
      interfaces = {
        wg0 = {
          configFile = "/home/zypperia/wg0-client.conf";
          /*address = [ "10.0.0.2/24" ];
          listenPort = 51830;

          dns = [ "8.8.8.8" ];

          privateKey = "YDshxGjrlZ5d+Q3zAjO0MpsL0UjcibjJm6LD5GexglU=";

          peers = [
            {
              publicKey = "8+ijyobGgvww/4V/GbloSZtkoYrl37t5tGt7SmPBRig=";
              allowedIPs = [ "0.0.0.0/0" ];
              endpoint = "188.225.10.119:51830";
              persistentKeepalive = 20;
            }
          ];*/
        };
      };
    };


    hosts = {
      "127.0.0.1" = ["localhost" "laptop-00"];
    };

    firewall = {
      enable = false;
      allowedTCPPorts = [ 2222 4444 ];
      allowedUDPPorts = [ 51830 ];
    };
  };
}
