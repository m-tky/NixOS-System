{
  config,
  pkgs,
  inputs,
  ...
}:

{
  users.users.user = {
    isNormalUser = true;
    description = "takuya";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirt"
      "storage"
      "plugdev"
    ];
    shell = pkgs.zsh;
  };
}
