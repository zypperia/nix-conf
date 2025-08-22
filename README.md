# My NixOS configuration

Host:
  - WSL
  - laptop-00
  - server-00
  - master-node
  - worker-node

Generate hardware config:

```sh
nixos-generate-config --show-hardware-config > hosts/<host>/hardware.nix
```
