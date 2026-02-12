{
  config,
  pkgs,
  inputs,
  ...
}:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "iommu=pt"
      "video=efifb:off"
    ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernel.sysctl = {
      "net.ipv4.tcp_mtu_probing" = 1;
      "net.ipv4.ip_forward" = 1;
    };
  };

  # Use latest kernel.
  hardware.cpu.amd.updateMicrocode = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  networking.hostName = "m75q";

  hardware.opentabletdriver = {
    enable = true;
  };

  # setting for clipboard
  services.spice-vdagentd.enable = true;
  networking.interfaces.enp2s0f1.wakeOnLan.enable = true;
}
