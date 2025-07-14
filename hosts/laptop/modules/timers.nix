{ pkgs, ... }:

{
  systemd.timers."maintaince" = {
    timerConfig = {
      OnCalendar = "*-*-* 0:00:00";
      Persistent = true;
    };
  };

  systemd.services."maintaince" = {
    script = ''
      ${pkgs.libnotify}/bin/notify-send System "System maintaince..."
      ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake /home/zypperia/nix-conf#laptop --upgrade
      ${pkgs.nix}/bin/nix-collect-garbage -d
      ${pkgs.nix}/bin/nix-store --optimise
      ${pkgs.systemd}/bin/systemctl kexec
    '';
  };
}
