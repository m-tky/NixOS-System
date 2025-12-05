{
  config,
  pkgs,
  inputs,
  ...
}:

{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirt"
      "dialout"
      "input"
    ];
    shell = pkgs.zsh;
  };
}
