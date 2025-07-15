yay -S --noconfirm --needed \
  wget curl unzip inetutils \
  fd eza fzf ripgrep zoxide bat batman \
  wl-clipboard fastfetch btop \
  man tldr less whois plocate \
  alacritty zsh stow \
  tmux openssh

# Use stow to create links in the .local directory for both dotfiles and hyprarch
mkdir -p ${HOME}/.local/bin
stow --target=${HOME}/.local --dir=${HOME}/.local/share/dotfiles/local .
stow --target=${HOME}/.local --dir=${HOME}/.local/share/hyprarch/local .
