{ pkgs, ...}:
let
  time-machine = pkgs.writeShellScriptBin "time-machine" ''
    wf-recorder -f time-machine/$(date +%Y-%m-%d0).mkv
  '';
in
{
  programs.virt-manager.enable = true;

  programs.fish.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    uv
  ];

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  environment.systemPackages = with pkgs; [
    wf-recorder
    time-machine
    libnotify
    policycoreutils
  ];
}
