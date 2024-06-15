{
  description = "PwnVim:- Neovim, the less is more 👾";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {

          packages = with pkgs;[ 
          neovim 
          fd
          ripgrep
          ];

          shellHook = ''
            ln -s $(pwd) /home/$(whoami)/.config/pwnvim
	    echo "Syncing Neovim plugins ..."
            nvim --headless +"Lazy! sync" +qa
          '';

          NVIM_APPNAME = "pwnvim";

        };
      });
}

