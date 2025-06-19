{
  services.qemuGuest.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "false";
    };
  };

  services.ollama = {
    enable = false;
#    acceleration = "cuda";
    loadModels = [ "mistral" ];
  };

  virtualisation.docker.enable = true;
}
