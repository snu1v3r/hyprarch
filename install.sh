#!/usr/bin/env bash

initialize() {
  BLACK=$'\033[0;30m'
  RED=$'\033[0;31m'
  GREEN=$'\033[0;32m'
  ORANGE=$'\033[0;33m'
  BLUE=$'\033[0;34m'
  PURPLE=$'\033[0;35m'
  CYAN=$'\033[0;36m'
  WHITE=$'\033[1;37m'
  CLEAR=$'\033[0m'
  log_info "Logging started"
}

log_info() {
  echo -e "$(date +%T) $BLUE[i]$CLEAR $1" | tee -a /tmp/install.log
}

log_warning() {
  echo -e "$(date +%T) $ORANGE[!]$CLEAR $1" | tee -a /tmp/install.log
}

log_success() {
  echo -e "$(date +%T) $GREEN[*]$CLEAR $1" | tee -a /tmp/install.log
}

log_spaced() {
  echo "    $1" | tee -a /tmp/install.log
}

log_yes_no() {
  echo
  local QUESTION=$1
  read -p "$(date +%T) ${ORANGE}[?]${CLEAR} $QUESTION (y/n)? " -r -n 1
  echo
  log_info "$REPLY Answered to question : $QUESTION"
}

initialize

log_info "Installing git..."
pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

log_info "Cloning Hyprarch..."
rm -rf ~/.local/share/hyprarch/
git clone https://github.com/snu1v3r/hyprarch.git ~/.local/share/hyprarch >/dev/null

log_info "Cloning Dotfiles..."
rm -rf ~/.local/share/dotfiles/
git clone --depth 1 --recurse-submodules --shallow-submodules https://github.com/snu1v3r/dotfiles.git ~/.local/share/dotfiles >/dev/null

log_info "Installation starting..."

# Install everything
for f in ~/.local/share/hyprarch/install/*.sh; do
  log_info "Starting $f"
  source "$f"
done

# Ensure locate is up to date now that everything has been installed
sudo updatedb

log_info "Installation finished."

gum confirm "Reboot to apply all settings?" && reboot
