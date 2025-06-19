{
  containers.minio = {
    autoStart = true;
    config = { config, pkgs, lib, ... }: {
      services.minio = {
        enable = true;
      };
    };
  };
}
