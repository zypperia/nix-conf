{ pkgs, ... }:

{
  boot = {
#    kernelPackages = pkgs.linuxPackages_hardened;
    loader.systemd-boot.enable = true;
#    supportedFilesystems = [ "bcachefs" ];
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

#  systemd.package = pkgs.systemd.override { withSelinux = true; };
}
