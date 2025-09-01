let
  splash = builtins.fetchurl { url = "https://raw.githubusercontent.com/zypperia/zypperia/refs/heads/main/grub.png"; sha256 = "d95f42357267edf8386927c313a7eb5d9b59ddb7751e76ada903f8d7ea89f5dc"; };
in

{ config, pkgs, ... }:

{
  boot = {
#    kernelParams = [
#      "resume_offset=1269313"
#    ];
#    resumeDevice = "/dev/disk/by-uuid/4fd72e0e-a072-4cc3-b855-1ed2ded4f916";
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      #systemd-boot.enable = true;
      grub = {
        device = "nodev";
        enable = true;
#        useOSProber = true;
        efiSupport = true;
        splashImage = splash;
        extraEntries = ''
          menuentry 'Gentoo GNU/Linux' --class gentoo --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-f770d085-9136-447d-a1b7-adba078903f9' {                                         
            if [ "x$grub_platform" = xefi ]; then                                                                                                                                                                  
              set gfxpayload=keep                                                                                                                                                                                
            fi                                                                                                                                                                                                     
            insmod gzio                                                                                                                                                                                            
            insmod part_gpt                                                                                                                                                                                        
            insmod ext2                                                                                                                                                                                            
            set root='hd0,gpt2'                                                                                                                                                                                    
            if [ x$feature_platform_search_hint = xy ]; then                                                                                                                                                       
              search --no-floppy --fs-uuid --set=root --hint-ieee1275='ieee1275/(null)/sas/disk@0,gpt2' --hint-bios=hd0,gpt2 --hint-efi=hd0,gpt2 --hint-baremetal=ahci0,gpt2  f770d085-9136-447d-a1b7-adba078903f9 
            else                                                                                                                                                                                                   
              search --no-floppy --fs-uuid --set=root f770d085-9136-447d-a1b7-adba078903f9                                                                                                                         
            fi                                                                                                                                                                                                     
            echo    'Loading Linux 6.12.41-gentoo-dist ...'                                                                                                                                                        
            linux   /boot/vmlinuz-6.12.41-gentoo-dist root=UUID=f770d085-9136-447d-a1b7-adba078903f9 ro                                                                                                            
            echo    'Loading initial ramdisk ...'                                                                                                                                                                  
            initrd  /boot/initramfs-6.12.41-gentoo-dist.img                                                                                                                                                        
          }
        '';
      };
      efi.canTouchEfiVariables = true;
    };
    #supportedFilesystems = [ "btrfs" ];
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
