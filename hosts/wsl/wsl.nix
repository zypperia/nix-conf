{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  programs.nix-ld.enable = true; 
  programs.nix-ld.libraries = with pkgs; [ 
    uv 
  ];

#  users.users.nixos.shell = pkgs.nushell;
  
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      X11Forwarding = false;
      PermitRootLogin = "yes"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  virtualisation.docker = {
    enable = true;
  };

  system.stateVersion = "25.05";
}
