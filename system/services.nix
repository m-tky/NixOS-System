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
        PasswordAuthentication = true;
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
        # for openclaw
        18789
        7777
      ];
      # option for tailscale exitnode
      checkReversePath = "loose";
      # NOTE:
      # libvirt default NAT (virbr0) requires explicit FORWARD acceptance.
      # When Tailscale or Docker is enabled, they may install their own
      # FORWARD chains (e.g. ts-forward), which can prevent libvirt NAT
      # from working correctly.
      #
      # Therefore, virbr0 forwarding is explicitly allowed here.
      extraForwardRules = ''
        # === libvirt NAT (virbr0) ===
        # VM -> outside
        iptables -A FORWARD -i virbr0 -j ACCEPT

        # outside -> VM (return traffic)
        iptables -A FORWARD -o virbr0 -m state --state RELATED,ESTABLISHED -j ACCEPT
      '';
    };
  };
}
