{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      vt = 7;
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd hyprland";
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
  };

  services.zapret = {
    enable = true;
    params = [
      "--dpi-desync=fake,disorder2"
      "--dpi-desync-ttl=1"
      "--dpi-desync-autottl=2"
    ];
    whitelist = [
      "youtube.com"
      "ytimg.com"
      "googlevideo.com"
      "youtu.be"
      "medium.com"
      "codewars.com"
      
      "discord.com"
      "dis.gd"
      "discord-attachments-uploads-prd.storage.googleapis.com"
      "discord.app"
      "discord.co"
      "discord.com"
      "discord.design"
      "discord.dev"
      "discord.gift"
      "discord.gifts"
      "discord.gg"
      "discord.media"
      "discord.new"
      "discord.store"
      "discord.status"
      "discord-activities.com"
      "discordactivities.com"
      "discordapp.com"
      "discordapp.net"
      "discordcdn.com"
      "discordmerch.com"
      "discordpartygames.com"
      "discordsays.com"
      "discordsez.com"
    ];
  };

  services.i2pd = {
    enable = false;
    proto = {
      http.enable = false;
      httpProxy.enable = false;
    };
  };

  services.jupyter = {
    enable = false;
    password = "argon2:$argon2id$v=19$m=10240,t=10,p=8$FvavSbZR1hE19yXK33xiqw$bWgs87zqs8PX1ga+pRUUHkDqcs8LKSJFIrp1l9hizy4";
  };

  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };
  services.supergfxd.enable = true;
  
  services.ollama = {
    enable = false;

    acceleration = "cuda";
    # https://ollama.com/library
    loadModels = [ "deepseek-r1:7b"];
  };

  #services.open-webui.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  #virtualisation.waydroid.enable = true;

  services.xserver.videoDrivers = ["nvidia"];

  powerManagement.enable = true;
}
