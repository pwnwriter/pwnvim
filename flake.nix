{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    in
    {
      devShells = builtins.listToAttrs (map
        (system: {
          name = system;
          value =
            let
              pkgs = import nixpkgs { inherit system; };
            in
            {
              default = pkgs.mkShell {
                packages = with pkgs; [
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
            };
        })
        systems);
    };
}
