{ pkgs, ... }:

{
  services.qemuGuest.enable = true;

  services.netbird.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  services.ollama = {
    enable = false;
#    acceleration = "cuda";
    loadModels = [ "mistral" ];
  };

  services.kmscon = {
    enable = true;
    fonts = [
      { name = "JetBrainsMono Nerd Font"; package = pkgs.nerd-fonts.jetbrains-mono; }
    ];
  };

#  services.ceph = {
#    global.fsid = "";
#    osd = {
#      enable = true;
#      daemons = ["0"];
#    };
#    mon = {
#      enable = false;
#      extraConfig = {
#        "mon initial members" = "mesh-a";
#        "mon host" = "";
#      };
#    };
#  };

#  systemd.services.ceph-mesh = {
#    enable = true;
#    unitConfig = {
#      After = "local-fs.target";
#      Wants = "local-fs.target";
#    };
#    serviceConfiig = {
#      Type
#    };
#  };

  virtualisation.libvirtd.enable = true;
#  virtualisation.docker.enable = true;
}
