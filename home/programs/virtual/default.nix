{ config, pkgs, ... }: {
  home.packages = [
    pkgs.qemu_kvm
    pkgs.virt-manager
    pkgs.spice-vdagent
    pkgs.libvirt
  ];
}
