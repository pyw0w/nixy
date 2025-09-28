{ inputs, pkgs, ... }: {
  home.packages = [
    inputs.zenix.packages.${pkgs.system}.default
  ];
}
