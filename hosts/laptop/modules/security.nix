{ pkgs, ... }:

{
  security.polkit.enable = true;

#  systemd.package = pkgs.systemd.override { withSelinux = true; };

  # Security services

#  systemd.services.hashsumCorruptCheck = {
#    wantedBy = [ "multi-user.target" ];
#    description = "Check initrd and bzImage using sha256sum";
#    serviceConfig = {
#      Type = "simple";
#      ExecStart = ''
#        if [ "$(${pkgs.coreutils}/bin/sha256sum $(find /boot -type f)) -z" != "${pkgs.runCommand "sha256sum $(find /boot -type f) -z"}" ]; then
#          echo "Waring!!!" > /home/zypperia/result
#        fi
#      '';
#      ExecStop = ''
#        echo "Worked!" > /home/zypperia/state
##      '';
#    };
#  };
}
