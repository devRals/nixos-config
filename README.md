<div align="center">
    <img alt="nixos logo" src="./assets/logo.png" width="120px"/>
</div>
# devRals's NixOS Files

My personal NixOS configuration and dotfiles.

This repository contains everything I use to configure my system, including my NixOS modules, Home Manager configuration, desktop environment, and development tools. The goal is to keep my setup reproducible, organized, and easy to iterate on.

## Features

- NixOS system configuration
- Home Manager configuration
- Hyprland-based desktop
- Quickshell desktop shell
- Wayland utilities and tooling
- Themed applications and desktop

## Repository Structure

```text
.
├── hosts/          # Host-specific NixOS configurations
├── system/         # Reusable NixOS modules
├── home/           # Home Manager configuration
├── assets/         # Images and screenshots
├── themes/         # Stylix related themes and wallpapers
└── flake.nix
```

## Installation

Clone the repository:

```bash
git clone https://github.com/devRals/nixos.git
cd nixos
```

Build the system:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

Replace `<hostname>` with the name of your machine defined in this repository.

## Screenshots

Screenshots will be added as the desktop shell and configuration evolve.

## Notes

This repository is primarily intended for my own use. Feel free to explore, borrow ideas, or adapt parts of the configuration for your own setup.

## License

Unless stated otherwise, the contents of this repository are available under the MIT License.
