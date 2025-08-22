{ config, lib, pkgs, ... }: {
  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
    stateVersion = "25.05";

    packages = with pkgs; [
      helix
      chafa
    ];

    sessionVariables = {
      EDITOR = "hx";
    };
  };

  programs.git = {
    enable = true;
    userName  = "zephyrorg";
    userEmail = "zephyrorg@proton.mail";
  };

  #programs.chafa.enable = true;
  
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "sixel";
        source = "/home/nixos/nix-conf/assets/nixos-fastfetch.png";
      };
#      modules = [
#        {
#          type = "datetime";
#          key = "Data";
#          format = "{1}-{3}-{2024}";
#        }
#      ];
    };
  };
}
