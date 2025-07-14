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

  services.pipewire = {
    enable = true;
    alsa.enable = true;
  };
  services.gnome-keyring.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };
}

services.thermald.enable = true;
services.tlp.enable = true;

/* services.auto-cpufreq = {
  enable = true;
  settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
}; */
