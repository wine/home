{ pkgs, ... }:
{
  imports =
    [
      ./hardware/zeppelin.nix
      ./modules/system.nix
      ./modules/accounts.nix
      ./modules/development.nix
      ./modules/desktop.nix
    ];
}

