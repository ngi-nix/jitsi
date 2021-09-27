{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";

  outputs = { self, nixpkgs }: {
    overlay = self: super: {
      jitsi-meet = super.jitsi.override  (old: {
        src = super.fetchFromGitHub {
          owner = "jitsi";
          repo = "jitsi-meet";
          rev = "e03d32cdcf62479ba2ec29418df046d652aa9266";
          # If you don't know the hash, the first time, set:
          # sha256 = "0000000000000000000000000000000000000000000000000000";
          # then nix will fail the build with such an error message:
          # hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
          # wanted: sha256:0000000000000000000000000000000000000000000000000000
          # got:    sha256:173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
          sha256 = "0000000000000000000000000000000000000000000000000000";
        };
      });


    }
    nixosModules.jitsi = import nix/module.nix;
    nixosModule = self.nixosModules.jitsi;
  };
}
