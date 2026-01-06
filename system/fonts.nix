{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      ibm-plex
      moralerspace
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-color-emoji
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "IBM Plex Serif" ];
        sansSerif = [ "IBM Plex Sans JP" ];
        emoji = [ "Noto Color Emoji" ];
      };
      enable = true;
      hinting = {
        enable = true;
        style = "full";
      };
      antialias = true;
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
    };
  };
}
