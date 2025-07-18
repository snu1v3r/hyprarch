#!/usr/bin/env bash
# This script is used to install and configure plymouth

yay -S --noconfirm --needed \
  plymouth

sudo mkdir -p /usr/share/plymouth/themes
sudo mv ~/.local/share/hyprarch/themes/plymouth/Anonymous /usr/share/plymouth/themes/Anonymous
sudo mv ~/.local/share/hyprarch/themes/plymouth/Error /usr/share/plymouth/themes/Error

sudo plymouth-set-default-theme Error -R

# Update grub to enable loading of splash screen as part of the boot
sed "s/\(GRUB_CMDLINE_LINUX_DEFAULT=\"[^\"]*\)/\\1 splash/" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Needed to ensure that plymouth is loaded as early as possible
sudo mkinitcpio -A plymouth -g /boot/initramfs-linux.img
