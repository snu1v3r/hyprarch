# Use stow to create links to config of both dotfiles and hyprarch
stow --target=${HOME}/.config --dir=${HOME}/.local/share/dotfiles/stowed_files/config .
stow --target=${HOME}/.config --dir=${HOME}/.local/share/hyprarch/config .

tee ${HOME}/.config/hypr/overrides.conf >/dev/null <<EOF
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
#
# Some suggestions
#
# Laptop only
# monitor = , 2880x1800@60.00, auto, 1.6
# env = GDK_SCALE, 1.6
# 
# Asus screen
# monitor = , 1920x1080@60.00, auto, 1
# env = GDK_SCALE, 1
#
# HP-monitors
# monitor = , 2560x1440@60.00, auto, 1
# env = GDK_SCALE, 1
#
EOF

# Set zsh as default shell

sudo chsh -s $(which zsh) $USER

# Use default bashrc from hyprarch
echo "source ${HOME}/.local/share/hyprarch/default/bash/rc" >${HOME}/.bashrc

ln -snf ${HOME}/.local/share/dotfiles/zsh/zshrc ${HOME}/.zshrc

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
tee ${HOME}/.XCompose >/dev/null <<EOF
include "%L"

# Emoji
<Multi_key> <m> <s> : "😄" # smile
<Multi_key> <m> <c> : "😂" # cry
<Multi_key> <m> <l> : "😍" # love
<Multi_key> <m> <v> : "✌️"  # victory
<Multi_key> <m> <h> : "❤️"  # heart
<Multi_key> <m> <y> : "👍" # yes
<Multi_key> <m> <n> : "👎" # no
<Multi_key> <m> <f> : "🖕" # fuck
<Multi_key> <m> <w> : "🤞" # wish
<Multi_key> <m> <r> : "🤘" # rock
<Multi_key> <m> <k> : "😘" # kiss
<Multi_key> <m> <e> : "🙄" # eyeroll
<Multi_key> <m> <d> : "🤤" # droll
<Multi_key> <m> <m> : "💰" # money
<Multi_key> <m> <x> : "🎉" # xellebrate
<Multi_key> <m> <1> : "💯" # 100%
<Multi_key> <m> <t> : "🥂" # toast
<Multi_key> <m> <p> : "🙏" # pray
<Multi_key> <m> <i> : "😉" # wink
<Multi_key> <m> <o> : "👌" # OK
<Multi_key> <m> <g> : "👋" # greeting
<Multi_key> <m> <a> : "💪" # arm
<Multi_key> <m> <b> : "🤯" # blowing

# Typography
<Multi_key> <space> <space> : "—"

# Identification
<Multi_key> <space> <n> : "$HYPRARCH_USER_NAME"
<Multi_key> <space> <e> : "$HYPRARCH_USER_EMAIL"
EOF
