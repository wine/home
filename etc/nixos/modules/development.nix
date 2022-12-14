{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [ # Java
      jdk
      gradle
      jetbrains.idea-ultimate
  ];
}