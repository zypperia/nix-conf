let
  #image = builtins.fetchurl { url = "https://raw.githubusercontent.com/zypperia/nix-conf/refs/heads/main/assets/wallpaper-theme-converter.png"; sha256 = "5ab354df48f6643f3b80f8a0a7f233838e2d1b60664c8d62cc87140c40af5f24"; };
  image = builtins.fetchurl { url = "https://github.com/zypperia/nix-conf/blob/main/assets/wallpaper-nord.png?raw=true"; sha256 = "8e77f53b01415b907a63729776dee0aa6f342790a20088b9b8337655501ff877"; };
in

{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  home = {
    username = "zypperia";
    homeDirectory = "/home/zypperia";
    stateVersion = "25.05";

    pointerCursor = {
      name = "rose-pine-hyprcursor";
      package = pkgs.rose-pine-hyprcursor;
      gtk.enable = true;
      # x11.enable = true;
      #package = pkgs.bibata-cursors;
      #name = "Bibata-Modern-Classic";
      size = 24;
    };

/*    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      #QT_QPA_PLATFORM = "wayland";
    };*/

    packages = with pkgs; [
      appimage-run
      
      bat
      wget
      niri
      alacritty
      nautilus
      mpv
      imv
      alsa-utils
      brightnessctl
      chafa
      imagemagick
      wlsunset
      swaybg
      onefetch
      keepassxc
      openscad
      acpi
      hyprshot
      rmpc
      yazi
      gnome-text-editor
      xdg-desktop-portal-hyprland

      virt-manager
      docker-compose
      obsidian
      nitch
      (blender.override {
        cudaSupport = true;
      })
      #unityhub
      kicad
      dconf
      typst
      materialgram
      (discord.override {
        withVencord = true;
      })

      pvs-studio
      code-cursor
      vscode

      uv
      arch-install-scripts
      llvm
      lld
      clang
      ccache
      cmake
      gnumake
      python3
      rustup
      dbeaver-bin

#      jetbrains.rust-rover
#      jetbrains.clion
#      jetbrains.dataspell

      #wineWowPackages.stable
      ugs
      wineWowPackages.waylandFull
    ];
  };

  stylix = {
    enable = true;
    polarity = "dark";
    #image = image;

    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    targets.zen-browser.profileNames = [ "default" ];
    opacity = {
      terminal = 0.85;
      desktop = 0.85;
      applications = 0.85;
      popups = 0.85;
    };
    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;

      /*emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };*/

      sizes = {
        applications = 11;
        desktop = 11;
        terminal = 11;
      };
    };
  };

  xdg.portal.enable = true;
  xdg.portal.config.common.default = "hyprland";

  gtk = {
    enable = true;
    iconTheme.name = lib.mkForce "Papirus Dark";
    iconTheme.package = pkgs.papirus-icon-theme;
  };

  wayland.windowManager.river.enable = true;

  programs.btop.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/zypperia/nix-conf";
  };
  
  #programs.starship.enable = true;
  programs.bash = {
    enable = true;
    #promptInit = "eval \"$(starship init bash)\"";
    #initExtra = "eval \"$(starship init bash)\"";
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    #xwayland.enable = false;
    systemd.enable = true;


    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,auto";

      general = {
        gaps_in = 6;
        gaps_out = 12;
        border_size = 0;

        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
      };

    animations.enabled = false;

      env = [
        #"HYPRCURSOR_SIZE,24"
        #"HYPRCURSOR_THEME,Adwaita"
      ];

      /*exec-once = [
        "swaybg -i ~/downloads/output2.png"
        #"hyprctl setcursor adwaita-dark 24"
      ];*/

      bind = [
        "$mod, Q, exec, kitty"
        "$mod, R, exec, fuzzel"
        "$mod, C, killactive"
        "$mod, M, exit"

        "$mod, V, togglefloating,"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit"

        ", PRINT, exec, hyprshot -m region"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        # Workspaces move
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      windowrulev2 = [
        "size = 1000 1000,floating:1"
      ];

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
        touchpad.natural_scroll = true;
      };
    };
  };

  programs.hyprlock = {
    enable = true;
  };

  programs.fuzzel.enable = true;

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty";
        source = "~/nix-conf/assets/nixos-fastfetch.png";
      };

      display = {
        separator = ": ";
        color = {
          keys = "blue";
          title = "4;92";
        };
        key = {
          width = 10;
          charElapsed = "■";
          charTotal = "-";
        };
        percent = {
          type = 9;
          color = {
            green = "green";
            yellow = "light_yellow";
            red = "light_red";
          };
        };
      };

      modules = [
        "title"
        "|"
        {
          type = "os";
          key = "OS";
          keyColor = "blue";
          format = "{name} {version}";
        }
        {
          type = "kernel";
          key = "Kernel";
        }
        {
          type = "memory";
          key = "Memory";
          percent = {
            type = 3;
            green = 30;
            yellow = 70;
          };
        }
      ];
    };
  };


  programs.niriswitcher = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
    #commandLineArgs = [ "--ozone-platform=wayland" ];
  };

  programs.zen-browser = {
    enable = true;
    /*policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = {
        "{9202ad48-dcc8-4402-a058-ab3510777d08}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
        "{1b0ae2ed-4cab-419a-ada3-bb184803803e}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{df346de1-85c1-49b2-b541-54274ff995b4}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };*/

    profiles = {
      default = { };
    };
  };

  /*programs.obsidian = {
    enable = true;
#    defaultSettings = {
#    };
    vaults = {
      main = {
        enable = true;
        target = "data/";
        
        /*settings = {
          communityPlugins = [

            "remotely-save"

          ];
        };
        
      };
    };
  };*/

  programs.element-desktop.enable = true;

  programs.distrobox = {
    enable = true;
    containers = {
      kali = {
        image = "docker.io/kalilinux/kali-rolling:latest";
        additional_packages = "kali-linux-core kali-linux-default";
      };
      debian = {
        image = "docker.io/debian:latest";
        additional_packages = "systemd";
      };
    };
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  /*programs.neovim = {
    enable = true;
    plugins = [
      pkgs.vimPlugins.nerdtree
      pkgs.vimPlugins.ollama-nvim
      pkgs.vimPlugins.nvim-fzf
    ];
  };*/

  #programs.vscode = {
  #  enable = true;
  #  extensions = with pkgs.vscode-extensions; [ ];
  #};

  programs.zed-editor = {
    enable = true;

    userSettings = {
      telemetry = {
        metrics = false;
        diagnostics = false;
      };

      project_panel = {
        dock = "right";
      };
    };
  };

  programs.git = {
    enable = true;
    userEmail = "nethunter15@proton.me";
    userName = "zypperia";
  };

  services.dunst.enable = true;
  services.mpd = {
    enable = true;
    musicDirectory = "/home/zypperia/music";
  };
}
