#!/usr/bin/env bash

sudo mkdir -p /boot/grub/themes
sudo mv ~/.local/share/hyprarch/themes/grub/SekiroShadow /boot/grub/themes

# This ensures that the theme is configured
sudo sed -i "s/^#\?\(GRUB_THEME=\).*$/\\1\"\/boot\/grub\/themes\/SekiroShadow\/theme.txt\"/" /etc/default/grub

# This ensures that grub uses a higher graphix resolution
sudo sed -i "s/^#\?\(GRUB_GFXMODE=\).*$/\\11920x1080/" /etc/default/grub

sudo sed -i "s/\(GRUB_CMDLINE_LINUX_DEFAULT=\"[^\"]*\)/\\1 splash/" /etc/default/grub
# Update grub to enable updates
sudo grub-mkconfig -o /boot/grub/grub.cfg
