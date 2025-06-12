{ pkgs, ... }:

{
  systemd.timers."auto-rebuild-switch" = {
    timerConfig = {
      OnCalendar = "*-*-* 0:00:00";
      Persistent = true;
    }
  };

  systemd.services."auto-rebuild-switch" = {
    script = ''
      ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake /home/zypperia/nix-conf#laptop --upgrade
      ${pkgs.systemd}/bin/systemctl kexec
    '';
  };

}
