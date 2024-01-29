{
  description = "NvChad flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { nixpkgs, neovim-nightly-overlay, ... }:
    let
      overlay = import neovim-nightly-overlay;
      pkgs = import nixpkgs {
        overlays = [ overlay.overlay ];
      };

      forAllSystems = function:
        nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ] (system: function system);

    in
    {
      devShells = forAllSystems (system: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            neovim-nightly
          ];

          shellHook = ''
            mv ~/.config/nvim ~/.config/nvim.backup
            ln -s $(pwd) ~/.config/nvim
            mv ~/.local/share/nvim ~/.local/share/nvim.backup
          '';
        };
      });
    };
}
