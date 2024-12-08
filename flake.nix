{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
      forAllSystems =
        function: nixpkgs.lib.genAttrs systems (system: function (import nixpkgs { inherit system; }));
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            neovim
            fd
            ripgrep
          ];
          shellHook = ''
            ln -s "$(pwd)" "$HOME/.config/pwnvim"
            echo "Syncing Neovim plugins ..."
            nvim --headless +"Lazy! sync" +qa
          '';

          env = {

            NVIM_APPNAME = "pwnvim";

          };

        };
      });
    };
}
