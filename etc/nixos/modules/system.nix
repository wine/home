{ pkgs, ... }:
{
  nixpkgs.overlays =
    [ (import (builtins.fetchTarball {
        url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      }))
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    emacs = {
      enable = true;
      package = pkgs.emacsUnstable;
    };
  };

  programs = {
    gnupg.agent.enable = true;

    git = {
      enable = true;
      package = pkgs.gitFull;
      config = {
        init.defaultBranch = "main";
	commit.gpgSign = true;
	credential.helper = "libsecret";
      };
    };
  };
}
