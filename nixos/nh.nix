{config, pkgs, ...}: {
  # nh - Nix helper for managing NixOS configurations
  programs.nh = {
    enable = true;
    flake = "/home/${config.var.username}/.config/nixos";
    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
