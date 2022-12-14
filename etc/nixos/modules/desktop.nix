{ pkgs, ... }:
{
  nixpkgs.overlays =
    [ (self: super: {
        discord = super.discord.overrideAttrs (_: {
	  src = builtins.fetchTarball "https://discord.com/api/download?platform=linux&format=tar.gz";
	});
      })
    ];

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager = {
        xterm.enable = false;
        gnome.enable = true;
      };

      videoDrivers =
        [ "nvidia"
	];
    };

    gnome.gnome-keyring.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    udev.packages =
      [ pkgs.gnome.gnome-settings-daemon
      ];
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs;
      [ ubuntu_font_family
        noto-fonts
        noto-fonts-emoji
        fira-code
        fira-code-symbols
      ];
    fontconfig = {
      defaultFonts = {
        serif =
	  [ "Ubuntu"
	  ];
	sansSerif =
	  [ "Ubuntu"
	  ];
	monospace =
	  [ "Ubuntu"
	  ];
      };
    };
  };

  programs = {
    dconf.enable = true;
    noisetorch.enable = true;
  };

  environment.systemPackages = with pkgs;
    [ gnome.gnome-tweaks
      gnomeExtensions.appindicator
      arc-theme

      firefox
      spotify
      discord

      prismlauncher
  ];

  # Get rid of Gnome bloat
  environment.gnome.excludePackages = (with pkgs.gnome;
    [ evince
      file-roller
      geary
      gnome-disk-utility
      sushi

      gnome-backgrounds
      gnome-bluetooth
      gnome-color-manager
      gnome-software
      baobab
      cheese
      eog
      epiphany
      gnome-calculator
      gnome-calendar
      gnome-characters
      gnome-clocks
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-system-monitor
      gnome-weather
      simple-scan
      totem
      yelp
    ]) ++ (with pkgs;
      [ gnome-connections
        gnome-text-editor
	gnome-tour
	gnome-photos
	gnome-user-docs
	orca
      ]);
}
