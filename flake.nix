{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";

  outputs = { self, nixpkgs }: {
    nixosModules.jitsi = import nix/module.nix;
    nixosModule = self.nixosModules.jitsi;
  };
}
