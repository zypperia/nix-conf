{ pkgs, lib, ... }:
let
  time-machine = pkgs.writeShellScriptBin "time-machine" ''
    wf-recorder -f ~/screencaptures/$(date +%Y-%m-%d).mkv
  '';
in
{
  #  programs.virt-manager.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    uv
  ];

  programs.firejail = {
      enable = true;
      wrappedBinaries = {
        obsidian = {
          executable = "${lib.getExe pkgs.obsidian} --ozone-platform=wayland";
          /*extraArgs = [
            "--ozone-platform=wayland"
          ];*/
        };
    };
  };

  /*programs.ccache = {
    enable = true;
    owner = "zypperia";
  };*/
  
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    jetbrains-mono
  ];

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    
    systemPackages = with pkgs; [
      wf-recorder
      time-machine
      xdg-desktop-portal-hyprland

      xorg.xauth
      xorg.xhost
      docker-buildx
    ];
  };
}
