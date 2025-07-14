{ config, inputs, pkgs, ... }:

{
  containers.minio = {
    autoStart = false;
    config = { config, pkgs, lib, ... }: {
      services.minio = {
        enable = true;
      };
    };
  };

  containers.gitea = {
    autoStart = true;
    config = {
      services.forgejo = {
        enable = true;
        database.type = "postgres";
        lfs.enable = true;
        settings = {
          server = {
            #ROOT_URL = "https://${srv.DOMAIN}/"; 
            HTTP_PORT = 3000;
          };
          service.DISABLE_REGISTRATION = false; #true;
        };

      };

#      services.gitea = {
#        enable = true;
#        database = {
#          type = "postgres";
#        };
#        settings = {
#          server.PROTOCOL = "http+unix";
#          server.ROOT_URL = "http://100.75.122.182";
#        };
#      };

#      services.nginx = {
#        enable = true;
#        recommendedProxySettings = true;
#        virtualHosts = {
#          localhost = {
#            locations."/".proxyPass = "http://unix:/run/gitea/gitea.sock";
#          };
#        };
#      };
      
#      services.postgresql = {
#        enable = true;
#        ensureDatabases = ["gitea"];
#      };
    };
  };
#  virtualisation.arion = {
#    enable = true;
#    backend = "docker";
#    "excaildraw".settings.services."excaildraw" = {};
#  };
}
