pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning Hyprarch..."
rm -rf ~/.local/share/hyprarch/
git clone https://github.com/snu1v3r/hyprarch.git ~/.local/share/hyprarch >/dev/null

echo -e "\nCloning Dotfiles..."
rm -rf ~/.local/share/dotfiles/
git clone --recursive --depth 1 https://github.com/snu1v3r/dotfiles.git ~/.local/share/dotfiles >/dev/null

echo -e "\nInstallation starting..."
source ~/.local/share/hyprarch/install.sh
