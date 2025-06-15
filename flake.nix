{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f (import nixpkgs { inherit system; }));
    in
    {
      apps = forAllSystems (
        pkgs:
        let
          runtimeDeps = with pkgs; [
            gcc
            nixd
            lua-language-server
            ripgrep
            fd
          ];

          nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
            pkgs.neovimUtils.makeNeovimConfig {

              customRC = ''
                set runtimepath^=${./.}
                source ${./.}/init.lua
              '';
            }
            // {
              wrapperArgs = [
                "--prefix"
                "PATH"
                ":"
                "${pkgs.lib.makeBinPath runtimeDeps}"
              ];
            }
          );
        in
        {
          default = {
            type = "app";
            program = "${nvim}/bin/nvim";
          };
        }
      );
    };
}
