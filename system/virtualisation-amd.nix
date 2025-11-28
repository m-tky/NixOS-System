{
  config,
  pkgs,
  inputs,
  ...
}:
{
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      allowedBridges = [ "virbr0" ];

      # for OSX
      # extraConfig = ''
      #   security_driver = "none"
      #   unix_sock_group = "libvirt"
      #   unix_sock_rw_perms = "0770"
      # '';

      qemu.swtpm = {
        enable = true;
      };
    };
  };
  programs.virt-manager.enable = true;
  boot.extraModprobeConfig = ''
    options kvm_amd nested=1
    options kvm ignore_msrs=1 report_ignored_msrs=0
  '';

  environment.systemPackages = with pkgs; [
    docker-compose

    # packages for MacOS
    dnsmasq
    vde2
    dosfstools
    bridge-utils
    # ネットワーキング/ファイアウォール
    nftables
    iptables
    ebtables
  ];
}
