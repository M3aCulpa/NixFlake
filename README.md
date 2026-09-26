# nix-flake

A Nix flake-based setup to manage macOS (via `nix-darwin`), NixOS-WSL, Homebrew integration, and Home Manager modules. Modular layout for sharing config across devices.

## Layout

- **flake.nix**: top-level inputs, dev shell, formatter, and host outputs.
- **hosts/**: per-machine configuration (`mbp`, `nixos-wsl`).
- **settings/**: system-level NixOS / nix-darwin modules (fonts, Homebrew, users, nix daemon).
- **home/**: per-user Home Manager configs (shells, editors, dev tools).
- **modules/**: reusable Home Manager modules (alacritty, neovim).

## Build

```sh
# macOS (nix-darwin runs activation as root)
sudo darwin-rebuild switch --flake .#mbp

# NixOS-WSL
sudo nixos-rebuild switch --flake .#nixos-wsl
```

## Maintain

```sh
nix fmt                # alejandra over the whole tree
nix flake update       # refresh flake.lock
```

CI (`.github/workflows/ci.yml`) refreshes the lock, evaluates both hosts, and checks formatting on every push. When evaluation passes on a branch other than a pull request, it commits the refreshed `flake.lock` back to that branch.
