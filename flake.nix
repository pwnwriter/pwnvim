## TODO: Make it work xD

{
  description = "PwnVim :- Neovim, the less is more";

  inputs = {
          neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
          nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, neovim-nightly-overlay }:
  let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in {
          packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

          packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
