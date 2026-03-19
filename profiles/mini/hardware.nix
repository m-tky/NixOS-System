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
  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.bluetooth.enable = true;
  networking.hostName = "mini";
  hardware.graphics = {
    enable = true;
  };

  security.pam.loginLimits = [
    {
      domain = "*";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
  ];
  # setting for clipboard
  services.spice-vdagentd.enable = true;
}
