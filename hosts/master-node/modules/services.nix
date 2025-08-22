{ pkgs, ... }:
let
  # When using easyCerts=true the IP Address must resolve to the master on creation.
 # So use simply 127.0.0.1 in that case. Otherwise you will have errors like this https://github.com/NixOS/nixpkgs/issues/59364
  kubeMasterIP = "100.75.70.58";
  kubeMasterHostname = "master-node";
  kubeMasterAPIServerPort = 6443;
in
{
  #services.qemuGuest.enable = true;

  services.netbird.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 22 ];

    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  # Cluster stuff
  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

  services.kubernetes = {
    roles = ["master" "node"];
    masterAddress = kubeMasterHostname;
    apiserverAddress = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
    easyCerts = true;
    apiserver = {
      securePort = kubeMasterAPIServerPort;
      advertiseAddress = kubeMasterIP;
    };

    addons.dns.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    /*
      enableNvidia = true;
      extraOptions = "--default-runtime=nvidia";
    */
  };
}
