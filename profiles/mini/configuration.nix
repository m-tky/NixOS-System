# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./hardware.nix
    ./users.nix

    # core systems
    ../../system/core.nix
    ../../system/fonts.nix
    ../../system/programs.nix
    ../../system/locale.nix
    ../../system/services.nix
    ../../system/virtualisation-amd.nix
    ../../system/steam.nix
    ../../system/sound.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [
      5900
      5901
      5902
    ];
    allowedTCPPorts = [
      5900
      5901
      5902
      47984
      47989
      47990
      48010
    ];
    allowedUDPPortRanges = [
      {
        from = 47998;
        to = 48000;
      }
      {
        from = 8000;
        to = 8010;
      }
    ];
  };
}
