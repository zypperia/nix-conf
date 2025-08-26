let
  splash = builtins.fetchurl { url = "https://raw.githubusercontent.com/zypperia/zypperia/refs/heads/main/grub.png"; sha256 = "d95f42357267edf8386927c313a7eb5d9b59ddb7751e76ada903f8d7ea89f5dc"; };
in

{ config, pkgs, ... }:

{
  boot = {
    kernelParams = [
      "resume_offset=1269313"
    ];
    resumeDevice = "/dev/disk/by-uuid/4fd72e0e-a072-4cc3-b855-1ed2ded4f916";
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      /*grub = {
        device = "nodev";
        enable = true;
        useOSProber = true;
        efiSupport = true;
        splashImage = splash;
      };
      efi.canTouchEfiVariables = true;*/
    };
    supportedFilesystems = [ "btrfs" ];
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;  # dc

      modesetting.enable = true;
      open = false;
      
      powerManagement.enable = true;
      powerManagement.finegrained = true;

      nvidiaSettings = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        #sync.enable = true;

        #nvidiaBusId = "0000:01:00.0";
        nvidiaBusId = "PCI:1:0:0";

        #intelBusId = "0000:00:02.0";
        intelBusId = "PCI:0:2:0";
      };
    };
    nvidia-container-toolkit.enable = true;
  };

#  systemd.package = pkgs.systemd.override { withSelinux = true; };
}
