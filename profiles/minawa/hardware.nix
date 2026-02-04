{
  config,
  pkgs,
  inputs,
  ...
}:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # Use latest kernel.
  hardware = {
    cpu.amd.updateMicrocode = true;
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      enabled = true;
      open = false;
  };
  networking.hostName = "minawa";

  # setting for clipboard
  services.spice-vdagentd.enable = true;
}
