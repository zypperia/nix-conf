# My NixOS configuration

Host:
  - WSL
  - laptop-00
  - server-00

Generate hardware config:

```sh
nixos-generate-config --show-hardware-config > hosts/laptop/hardware.nix
```