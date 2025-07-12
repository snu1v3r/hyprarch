# Copy over hyprarch configs
cd ~/.local/share/dotfiles/stowed_files/config
stow .

cd ~/.local/share/hyprarch/config
stow .

tee ~/.config/hypr/overrides.conf >/dev/null <<EOF
# This file can be used to override monitor settings on a system specific level 
# See https://wiki.hyprland.org/Configuring/Monitors/

# Use single default monitor (see all monitors with: hyprctl monitors)
# monitor= ,preferred,auto,auto
# monitor = [name], preferred | <width>x<height>[@<frequency>],auto | <position right>x<position down>, auto | <scaling factor>

# Example for Framework 13 w/ 6K XDR Apple display
# monitor = DP-5, 6016x3384@60.00, auto, 2
# monitor = eDP-1, 2880x1920@120.00, auto, 2
#
# Extra env variables
# env = GDK_SCALE,1 # Change to 1 if on a 1x display
EOF

# Set zsh as default shell

sudo chsh -s $(which zsh) $USER

# Use default bashrc from hyprarch
echo "source ~/.local/share/hyprarch/default/bash/rc" >~/.bashrc

# Login directly as user, rely on disk encryption + hyprlock for security
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER --noclear %I \$TERM
EOF

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch master

# Set identification from install inputs
if [[ -n "${HYPRARCH_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$HYPRARCH_USER_NAME"
fi

if [[ -n "${HYPRARCH_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$HYPRARCH_USER_EMAIL"
fi

# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/hyprarch/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$HYPRARCH_USER_NAME"
<Multi_key> <space> <e> : "$HYPRARCH_USER_EMAIL"
EOF
