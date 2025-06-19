{ config, pkgs, libs, ... }:

{
  containers.gitea = {
    autoStart = false;
    config = { config, pkgs, lib, ... }: {
      services.gitea = {
        enable = true;
        database.type = "postgres";
        database.host = "188.225.10.119";
        
      };
    };
  };
}
