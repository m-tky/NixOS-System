# modules/shell/zsh.nix
{ config, pkgs, ... }:

{
  programs = {
    wireshark = {
      enable = true;
      dumpcap.enable = true;
    };
    zsh.enable = true;
    git.enable = true;
    neovim = {
      enable = true;
      # defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    tmux.enable = true;
    bat.enable = true;
    weylus = {
      enable = true;
      users = [ "user" ];
      openFirewall = true;
    };
    # sway = {
    #   enable = true;
    #   xwayland.enable = true;
    # };
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    # hyprlock.enable = true;
  };
  niri-flake.cache.enable = true;
  # services.hypridle.enable = true;
}
