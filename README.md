# nix-flake

A Nix flake-based setup to manage macOS (via `nix-darwin`), Homebrew integration, and Home Manager modules. This repo takes a modular approach, making it easy to configure environments and tools across devices.

## Key Directories

- **home/**: Home Manager configs for shells, editors, and terminal emulators.
- **hosts/**: Device-specific configs (e.g., MacBook Pro, desktop).
- **modules/**: Reusable Nix modules for apps and tools.
- **settings/**: System settings for macOS and NixOS (fonts, Homebrew, etc.).

## Secrets Management

- **agenix**: Securely manage Nix secrets using age-encrypted files.