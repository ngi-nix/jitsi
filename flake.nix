{
  inputs.nixpkgs.url = "github:tshaynik/nixpkgs/jitsi-6293";

  outputs = { self, nixpkgs }: {
    nixosModules.jitsi = import nix/module.nix;
    nixosModule = self.nixosModules.jitsi;
  };
}
