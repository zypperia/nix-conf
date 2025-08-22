{ pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.xonsh;
    users = {
      zephyr = {
        isNormalUser = true;

        home = "/home/zephyr";

        extraGroups = ["wheel" "docker" "nix" "libvirtd"];
        openssh.authorizedKeys.keys  = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSTWcRk0nSmVyfpb7DK+Zm5tnhAtWbBf62X4VMVBLI4 nixos@nixos" ];
      };
    };

    #mesh = { isNormalUser = true; extraGroups = [ "wheel" "docker" ]; };
    #ceph = { isNormalUser = true; extraGroups = [ "wheel" "ceph" ]; };
  };
}
