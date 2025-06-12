{ config, pkgs, ... }: {
  home = {
    username = "zephyr";
    homeDirectory = "/home/zephyr";
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
