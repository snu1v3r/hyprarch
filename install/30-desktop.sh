yay -S --noconfirm --needed \
  brave-bin keepassxc nextcloud-client qt5-wayland \
  galculator nautilus flameshot vlc \
  fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt \
  brightnessctl evince imv \
  wl-clip-persist clipse sushi pamixer playerctl pavucontrol wireplumber

# Needed to pre-install keepassxc plugin in brave-bin

if command -v keepassxc &>/dev/null; then
  if [ -f /opt/brave-bin/brave ]; then
    echo '{ "external_update_url": "https://clients2.google.com/service/update2/crx" }' >/tmp/oboonakemofpalcgghocfoadofidjkkk.json
    sudo mkdir -p /opt/brave-bin/extensions && sudo mv /tmp/oboonakemofpalcgghocfoadofidjkkk.json /opt/brave-bin/extensions
  fi
fi
