{ config, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "assets/nixos-fastfetch";
      };
      modules = [
        {
          type = "datetime";
          key = "Data";
          format = "{1}-{3}-{2024}";
        }
      ];
    };
  };
}
