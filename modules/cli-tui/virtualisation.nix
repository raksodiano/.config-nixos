{ config, pkgs, ... }:

{
  # QEMU / KVM / Libvirt
  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
  };

  programs.virt-manager.enable = true;

  boot.kernelModules = [
    "kvm-intel"
    "vhost_net"
    "tun"
    "vhost_vsock"
  ];

  environment.systemPackages = with pkgs; [
    qemu
    qemu_kvm
    pkgs."qemu-user"
    OVMF
    spice
    spice-gtk
    swtpm
  ];

  virtualisation.spiceUSBRedirection.enable = true;

  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "armv7l-linux"
    "riscv64-linux"
  ];
}
