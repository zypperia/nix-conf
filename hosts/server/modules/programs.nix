{ pkgs, ...}:

{
  programs.xonsh.enable = true;

  environment.systemPackages = with pkgs; [
#    agenix.packages.x86_64-linux.default
    tealdeer
    helix
    nixops_unstable_full
    fastfetch
    chafa
    btop
  ];  
}
