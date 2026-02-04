{
  config,
  pkgs,
  inputs,
  ...
}:
{
  nix = {
    settings = {
      sandbox = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # allow proprietary packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = [ pkgs.networkmanager-openvpn ];
  };
  networking.enableIPv6 = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.displayManager.gdm.enable = true;

  # services.desktopManager.gnome.enable = true;
  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
  };
  # Configure keymap in X11
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    displayManager.gdm.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    printing.enable = true;
    udisks2.enable = true;
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  environment.systemPackages = with pkgs; [
    android-tools
    xwayland-satellite
    ethtool
    coreutils
    ncurses
    usbutils
    tree
    ripgrep
    inputs.home-manager.packages.${pkgs.system}.default
    ethtool
    nfs-utils
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
