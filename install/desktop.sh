yay -S --noconfirm --needed \
  keepassxc qt5-wayland \
  brave-bin \
  nautilus \
  gnome-calculator \
  nextcloud-client
# wl-clip-persist clipse \
# chromium vlc # fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool \
# nautilus sushi gnome-calculator \
#  keepassxc-qt6 #   brightnessctl playerctl pamixer pavucontrol wireplumber \
#   evince imv

# Needed to pre-install keepassxc plugin in brave-bin

if ! command -v keepassxc &>/dev/null; then
  if [ -f /opt/brave-bin/brave ]; then
    echo '{ "external_update_url": "https://clients2.google.com/service/update2/crx" }' >/tmp/oboonakemofpalcgghocfoadofidjkkk.json
    sudo mkdir -p /opt/brave-bin/brave/extensions
    mv /tmp/oboonakemofpalcgghocfoadofidjkkk.json /opt/brave-bin/brave/extensions
  fi
fi
