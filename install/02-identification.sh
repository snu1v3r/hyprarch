#!/usr/bin/env bash
# Need gum to query for input
yay -S --noconfirm --needed gum

# Configure identification
echo -e "\nEnter identification for git and autocomplete..."
export HYPRARCH_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export HYPRARCH_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

# An optional selection for the profile if not already given
if [ "$PROFILE" = "" ]; then
  RESULT=$(gum choose Main Hacking Server --header="Select the target profile:")
  if [ "$RESULT" = "" ]; then
    PROFILE="main"
  else
    PROFILE=$(echo "$RESULT" | tr '[:upper:]' '[:lower:]')
  fi
fi

gum style "The following profile is used: $PROFILE"
