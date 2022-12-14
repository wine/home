{ ... }:
{
  users.users.ossian = {
    isNormalUser = true;
    extraGroups =
      [ "wheel"
      ];
  };

  programs.git.config.user = {
      name = "Ossian Winter";
      email = "ossian@hey.com";
      signingKey = "9B3A2B9FD2CCFB18E1256DCAC2E51F824DA846C9";
  };
}