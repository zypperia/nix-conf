{ pkgs, ... }:

{
  users = {
    # defaultUserShell = pkgs.xonsh;
    users = {
      zephyr = {
        isNormalUser = true;

        home = "/home/zephyr";
        initialPassword = "aidsbugs";

        extraGroups = ["wheel"];
        openssh.authorizedKeys.keys  = [ "" ];
      };
    };
  };
}
