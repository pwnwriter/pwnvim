{
  description = "pwnvim flake for nix";

  inputs = {
          neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
          nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, neovim-nightly-overlay }: {

          packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

          packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
