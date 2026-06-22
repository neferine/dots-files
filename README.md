# dotfiles

Hyprland dotfiles using Lua config, Waybar, and more.

## Structure

Each directory maps directly to `~/.config/<dir>` via symlink.

```
dots-files/
├── hypr/          # Hyprland (Lua config)
├── waybar/        # Waybar status bar
├── fastfetch/     # System info
├── fuzzel/        # App launcher
├── ghostty/       # Terminal emulator
├── Thunar/        # File manager
├── xfce4/         # Thunar config
├── zed/           # Editor
├── wofi/          # App launcher (alternative)
├── wallpapers/    # Wallpaper collection
├── .zshrc         # Zsh config (oh-my-zsh + p10k)
├── .dmrc          # Desktop session
└── PREREQUISITES.md
```

## Font

**Iosevka Nerd Font** is required for p10k icons.

```
sudo pacman -S ttf-iosevka-nerd
```

## Bluetooth

```
sudo pacman -S bluez bluez-utils blueman
sudo systemctl enable --now bluetooth.service
```

## Dependencies

See [PREREQUISITES.md](PREREQUISITES.md) for full list.

## Setup

```bash
git clone git@github.com:neferine/dots-files.git ~/.dots
for dir in ~/.dots/*/; do
  ln -sf "$dir" "${dir/#$HOME\/.dots/$HOME\/.config}"
done
ln -sf ~/.dots/.zshrc ~/.zshrc
ln -sf ~/.dots/.dmrc ~/.dmrc
```
