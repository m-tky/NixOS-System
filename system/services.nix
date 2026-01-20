{ config, pkgs, ... }:
{
  services = {
    udisks2 = {
      enable = true;
    };
    flatpak.enable = true;
    blueman.enable = true;
    tailscale.enable = true;
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
    gnome.evolution-data-server.enable = true;
  };
  networking = {
    firewall = {
      enable = true;
      trustedInterfaces = [
        "tailscale0"
        "virbr0"
      ];
      allowedUDPPorts = [
        config.services.tailscale.port
        7777
      ];
      allowedTCPPorts = [
        22
        # for ollama
        11434
        7777
      ];
      # option for tailscale exitnode
      checkReversePath = "loose";
      # port for kde connect
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
        # { from = 37000; to = 44000; }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
    nftables.enable = true;
  };
}
