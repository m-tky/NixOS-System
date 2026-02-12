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
    kdeconnect.enable = true;
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  };
  niri-flake.cache.enable = true;
  # services.hypridle.enable = true;
}
