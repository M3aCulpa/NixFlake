# nix-flake

A Nix flake-based setup to manage macOS (via `nix-darwin`), NixOS-WSL, Homebrew integration, and Home Manager modules. Modular layout for sharing config across devices.

## Layout

- **flake.nix**: top-level inputs, dev shell, and host outputs.
- **hosts/**: per-machine configuration (`mbp`, `nixos-wsl`).
- **settings/**: system-level NixOS / nix-darwin modules (fonts, Homebrew, users, nix daemon).
- **home/**: per-user Home Manager configs (shells, editors, dev tools).
- **modules/**: reusable Home Manager modules (alacritty, neovim).

## Build

```sh
# macOS
darwin-rebuild switch --flake .#mbp

# NixOS-WSL
sudo nixos-rebuild switch --flake .#nixos-wsl
```
