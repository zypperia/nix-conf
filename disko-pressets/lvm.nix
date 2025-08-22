{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
            };
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            primary = {
              size = "100%";
              content = {
                type = "lvm_pv";
                vg = "pool";
              };
            };
          };
        };
      };
    };
    lvm_vg = {format = "xfs";

              mountpoint = "/";
              mountOptions = [
                "defaults"
              ];
      pool = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100M";
            content = {
              type = "luks";
              
              {
                format = "xfs";

                mountpoint = "/";
              mountOptions = [
                "defaults"
              ];}
            };
          };
        };
      };
    };
  };
}
