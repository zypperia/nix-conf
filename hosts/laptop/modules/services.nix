{ pkgs, ... }:

{
  services.qemuGuest.enable = false;

  services.openssh = {
    enable = false;
    ports = [ 2222 ];
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  services.fail2ban = {
    enable = false;
    maxretry = 5;
    bantime = "52h";
  };

  services.greetd = {
    enable = true;
    settings = {
      vt = 7;
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd sway";
      };
    };
  };

  services.ollama = {
    enable = false;
    acceleration = "cuda";
    loadModels = [ "mistral" ];
  };

  services.open-webui.enable = false;
  
  virtualisation.docker.enable = false;
  virtualisation.libvirtd.enable = true;
}
