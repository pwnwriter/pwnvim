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
            [ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.before-pwnvim || true
             echo "Cloning, Syncing Neovim plugins ..."
             git clone --depth=1 https://github.com/pwnwriter/pwnvim ~/.config/nvim
             nvim --headless +"Lazy! sync" +qa
          '';

        };
      });
    };
}
