{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      vt = 7;
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd niri";
      };
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
  };
  
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };
}
