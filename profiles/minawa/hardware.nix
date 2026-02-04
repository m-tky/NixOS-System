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
    kernelParams = [
      "xe.force_probe=*"
      "i915.force_prube=!"
      "acpi_osi=\"Windows 2022\""
    ];
  };

  # Use latest kernel.
  services.fwupd.enable = true;
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = false;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  networking.hostName = "minawa";

  # setting for clipboard
  services.spice-vdagentd.enable = true;
}
