{ config, pkgs, inputs, ... }: {
  home = {
    username = "zypperia";
    homeDirectory = "/home/zypperia";
    stateVersion = "25.05";

    packages = with pkgs; [
      niri
      alacritty
      foot
      mpv
      mako
      clang-tools
      typst
      # linuxHeaders
      # inputs.zen-browser.packages.x86_64-linux.generic
    ];
  };

  /*
  catppuccin = {
    enable = true;
    flavor = "frappe";
  };*/

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
    };
  };

  # Mauve
  programs.fuzzel = {
    enable = true;

    /* settings = {
      colors = {
        background = "1e1e2edd";
        text="cdd6f4ff";
        prompt="bac2deff";
        placeholder="7f849cff";
        input="cdd6f4ff";
        match="cba6f7ff";
        selection="585b70ff";
        selection-text="cdd6f4ff";
        selection-match="cba6f7ff";
        counter="7f849cff";
        border="cba6f7ff";
      };
    }; */

  };

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "Fira Code:size=10";
      };
      csd = {
        preferred = "none";
        border-width = 0;
      };
    };
  };

  programs.qutebrowser = {
    enable = true;
    settings = {
      colors.webpage.darkmode.enabled = true;
    };
    /* extraConfig = ''
import os
from urllib.request import urlopen

config.load_autoconfig()

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'mocha', True)
    ''; */
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  programs.git = {
    enable = true;
    userEmail = "nethunter15@proton.me";
    userName = "zypperia";
  };
}
