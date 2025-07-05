pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning Hyprarch..."
rm -rf ~/.local/share/hyprarch/
git clone https://github.com/basecamp/hyprarch.git ~/.local/share/hyprarch >/dev/null

echo -e "\nInstallation starting..."
source ~/.local/share/hyprarch/install.sh
