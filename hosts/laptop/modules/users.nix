{ pkgs, ... }:


{
  users = {
    defaultUserShell = pkgs.fish;

    users.zypperia = {
      isNormalUser = true;

      home = "/home/zypperia";

      extraGroups = ["wheel" "libvirtd" "docker"];
      # openssh.authorizedKeys.keys  = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSTWcRk0nSmVyfpb7DK+Zm5tnhAtWbBf62X4VMVBLI4 nixos@nixos" ];
    };
  };
}
