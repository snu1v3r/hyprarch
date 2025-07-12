# Use dark mode for QT apps too (like VLC and kdenlive)
sudo pacman -S --noconfirm kvantum-qt5

# Prefer dark mode everything
sudo pacman -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Set initial theme
mkdir -p ~/.config/dotfiles/theme
ln -snf ~/.local/share/dotfiles/themes/tokyo-night ~/.config/dotfiles/theme/current
ln -snf $(find ~/.config/dotfiles/theme/current/backgrounds -type f -print -quit) ~/.config/dotfiles/theme/background

# Set specific app links for current theme
ln -snf ~/.config/dotfiles/theme/current/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -snf ~/.config/dotfiles/theme/current/wofi.css ~/.config/wofi/style.css
ln -snf ~/.config/dotfiles/theme/current/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/dotfiles/theme/current/btop.theme ~/.config/btop/themes/current.theme
mkdir -p ~/.config/mako
ln -snf ~/.config/dotfiles/theme/current/mako.ini ~/.config/mako/config
