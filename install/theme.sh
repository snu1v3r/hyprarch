# Use dark mode for QT apps too (like VLC and kdenlive)
sudo pacman -S --noconfirm kvantum-qt5

# Prefer dark mode everything
sudo pacman -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Set initial theme
mkdir -p ~/.config/hyprarch/current
ln -snf ~/.local/share/dotfiles/themes/tokyo-night ~/.config/hyprarch/current/theme
ln -snf $(find ~/.config/hyprarch/current/theme/backgrounds -type f -print -quit) ~/.config/hyprarch/current/background

# Set specific app links for current theme
ln -snf ~/.config/hyprarch/current/theme/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -snf ~/.config/hyprarch/current/theme/wofi.css ~/.config/wofi/style.css
ln -snf ~/.config/hyprarch/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/hyprarch/current/theme/btop.theme ~/.config/btop/themes/current.theme
mkdir -p ~/.config/mako
ln -snf ~/.config/hyprarch/current/theme/mako.ini ~/.config/mako/config
