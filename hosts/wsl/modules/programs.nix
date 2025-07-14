{ config, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
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
