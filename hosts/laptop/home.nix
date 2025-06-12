{ config, pkgs, ... }: {
  home = {
    username = "zypperia";
    homeDirectory = "/home/zypperia";
    stateVersion = "25.05";

    packages = with pkgs; [
      helix
      niri
      alacritty
    ];

    sessionVariables = {
      EDITOR = "hx";
    };
  };
}
