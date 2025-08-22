{
  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /home/nixos *(rw,no_root_squash)
  '';
  services.netbird.enable = true;
}
