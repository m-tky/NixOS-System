{
  config,
  pkgs,
  inputs,
  ...
}:

{
  users.users.takuya = {
    isNormalUser = true;
    description = "mukai-takuya";
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
