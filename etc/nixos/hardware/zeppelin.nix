{ lib, pkgs, ... }:

{
  system.stateVersion = "unstable";

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
  };

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = true;
    opengl.enable = true;
    nvidia.package = pkgs.linuxPackages_zen.nvidiaPackages.stable;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules =
        [ "nvme"
	  "xhci_pci"
	  "ahci"
	  "usbhid"
	  "usb_storage"
	  "sd_mod"
	];

      kernelModules =
        [
	];
    };

    kernelModules =
      [ "kvm-amd"
      ];

    extraModulePackages =
      [
      ];

    kernelPackages = pkgs.linuxPackages_zen;
  };

  fileSystems = {
    "/boot" =
      { device = "/dev/disk/by-uuid/BE82-C199";
        fsType = "vfat";
      };

    "/" =
      { device = "/dev/disk/by-uuid/d2d2d46c-f331-447b-81fd-d2df8503f43d";
        fsType = "ext4";
      };
  };

  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "zeppelin";
  };

  time.timeZone = "Europe/Stockholm";

  services.xserver.screenSection = ''
    Option "metamodes"                "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
    Option "AllowIndirectGLXProtocol" "off"
    Option "TripleBuffer"             "on"
  '';
}
