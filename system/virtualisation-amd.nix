{
  config,
  pkgs,
  inputs,
  ...
}:
{
  virtualisation = {
    # Podmanを有効化し、Dockerコマンドとしても使えるようにする
    podman = {
      enable = true;
      dockerCompat = true; # 'docker' コマンドがそのまま使えます
      defaultNetwork.settings.dns_enabled = true;
    };

    # 宣言的なコンテナ管理
    oci-containers = {
      backend = "podman";
    };

    libvirtd = {
      enable = true;
      allowedBridges = [ "virbr0" ];
      qemu = {
        swtpm.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
  };

  networking.firewall = {
    trustedInterfaces = [
      "podman0"
      "docker0"
    ];
  };

  programs.virt-manager.enable = true;

  boot.extraModprobeConfig = ''
    options kvm_amd nested=1
    options kvm ignore_msrs=1 report_ignored_msrs=0
  '';

  environment.systemPackages = with pkgs; [
    podman-compose
    tcpdump
    iproute2
  ];
}
