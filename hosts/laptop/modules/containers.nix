#{ config, pkgs, libs, ... }:

{
#  containers.gitea = {
#    autoStart = false;
#    config = { config, pkgs, lib, ... }: {
#      services.gitea = {
#        enable = true;
#        database.type = "postgres";
#        database.host = "188.225.10.119";
#
#      };
#    };
#  };

#  virtualisation.arion = {
#    backend = "docker";
#    projects = {
#      "excalidraw".settings.services."excalidraw".service = {
#        image = "excalidraw/excalidraw";
#        restart = "unless-stopped";
#      };
#    };
#  };
}
