# CHANGEME: Make sure to use a hardware-matching system configuration for bootloader
{ pkgs, lib, ... }:

{
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";
    boot.loader.grub.useOSProber = true;
}
