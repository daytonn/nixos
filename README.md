# Circuitron - NixOS Configuration

A comprehensive NixOS configuration for a development and gaming workstation with GNOME desktop environment.

## 🖥️ System Overview

- **Hostname**: Circuitron
- **Desktop Environment**: GNOME with extensive customization
- **Boot Loader**: systemd-boot
- **NixOS Version**: 25.05
- **User**: daytonn (Dayton Nolan)

## 🚀 Key Features

### Desktop Environment
- **GNOME Shell** with 14+ extensions for enhanced productivity
- **Dark theme** with teal accent color
- **Custom keybindings** for efficient workflow
- **Window management** with tiling support (gTile)
- **Visual effects** including burn-my-windows and compiz effects

### Development Tools
- **Code editors**: VS Code Cursor, Sublime Text 4
- **Database tools**: DBeaver
- **Version control**: Git with SSH support
- **Build tools**: GCC, Make, Autotools, pkg-config
- **Containerization**: Docker with auto-start
- **Shell enhancements**: Starship, fzf, mcfly, bash-completion

### Creative & Productivity
- **Graphics**: Blender, GIMP, Inkscape, FreeCAD
- **Office**: LibreOffice
- **Media**: VLC, Rhythmbox, Spotify
- **Communication**: Discord, Telegram, Zoom
- **Note-taking**: Joplin

### Gaming & Entertainment
- **Steam** with remote play and dedicated server support
- **LM Studio** for AI/ML applications
- **VirtualBox** for virtualization

### Security & Privacy
- **ProtonVPN** and **Proton Pass**
- **GPG** with SSH support
- **YubiKey** OATH support
- **Flatpak** for sandboxed applications

## 🎨 GNOME Extensions

The system includes the following GNOME extensions:
- `auto-move-windows` - Automatic window positioning
- `burn-my-windows` - Window transition effects
- `compiz-windows-effect` - Additional window effects
- `docker` - Docker integration
- `emoji-copy` - Quick emoji access
- `force-quit` - Force quit applications
- `gTile` - Advanced window tiling
- `notification-banner-reloaded` - Enhanced notifications
- `reboottouefi` - UEFI reboot option
- `status-area-horizontal-spacing` - Status area layout
- `user-themes` - Custom theme support
- `weather-oclock` - Weather in clock
- `weeks-start-on-monday` - Monday start calendar

## 🔧 System Configuration

### Hardware Support
- **NVIDIA Graphics**: Open-source kernel modules (recommended for RTX/GTX 16xx)
- **Audio**: PipeWire with ALSA and PulseAudio compatibility
- **Printing**: CUPS printing system
- **Smart Cards**: PC/SC support for smart card readers

### Networking
- **NetworkManager** for network configuration
- **Steam networking** with firewall rules for remote play

### Localization
- **Timezone**: America/Phoenix
- **Locale**: en_US.UTF-8
- **Keyboard**: US layout with Caps Lock as Ctrl modifier

## 📦 Package Management

### User Packages
The system includes 70+ user packages covering:
- Development tools and compilers
- Creative and design software
- Office and productivity applications
- Media players and entertainment
- Security and privacy tools
- System utilities and customization

### System Packages
Core development and system tools including:
- Build essentials (gcc, make, autotools)
- Version control (git, openssh)
- System utilities (vim, wget, unzip)

## 🎯 Custom Keybindings

- **Alt+Q**: Close window
- **Alt+H**: Minimize window
- **Shift+Alt+3**: Screenshot
- **Shift+Alt+4**: Screenshot UI
- **Shift+Alt+5**: Window screenshot
- **Caps Lock**: Functions as Ctrl modifier

## 🚀 Getting Started

### Prerequisites
- NixOS system with flakes support enabled
- Hardware configuration file (`hardware-configuration.nix`)

### Installation
1. Clone this repository to `/etc/nixos/`
2. Ensure `hardware-configuration.nix` is present
3. Run `sudo nixos-rebuild switch`

### Updating
```bash
cd /etc/nixos
sudo nixos-rebuild switch --upgrade
```

## 🔍 Configuration Structure

```
configuration.nix          # Main system configuration
hardware-configuration.nix # Hardware-specific settings (not included)
```

## ⚠️ Important Notes

- **Unfree packages** are allowed (`nixpkgs.config.allowUnfree = true`)
- **Experimental features** are enabled (nix-command, flakes)
- **AppImage support** is enabled for additional software
- **32-bit audio support** is enabled for compatibility

## 🛠️ Customization

### Adding New Packages
Add packages to the `users.users.daytonn.packages` list in `configuration.nix`.

### Modifying GNOME Settings
Edit the `extraGSettingsOverrides` section in the GNOME configuration.

### System-wide Packages
Add packages to `environment.systemPackages` for system-wide availability.

## 📚 Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [NixOS Wiki](https://nixos.wiki/)
- [GNOME Extensions](https://extensions.gnome.org/)

## 🤝 Contributing

This is a personal NixOS configuration. Feel free to use as a reference or adapt for your own system.

## 📄 License

This configuration is provided as-is for educational and reference purposes.

---

**Note**: This configuration is designed for a specific hardware setup. Ensure compatibility with your system before deployment. 