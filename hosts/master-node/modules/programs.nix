{ pkgs, ...}:

{
  programs.xonsh.enable = true;

  environment.systemPackages = with pkgs; [
#    agenix.packages.x86_64-linux.default
    tealdeer
    vim
    git
    # Cluster stuff
    kompose
    kubectl
    kubernetes
  ];
}
