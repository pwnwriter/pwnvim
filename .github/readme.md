<img width="1440" alt="Screenshot 2024-05-31 at 14 06 58" src="https://github.com/pwnwriter/pwnvim/assets/90331517/a318a757-bfc8-48fb-9ec1-259726b83f74">

----

```sh
git clone https://github.com/pwnwriter/pwnvim ~/.config/nvim
nvim --headless +"Lazy! sync" +qa
```

## 🍦 Tips

   
> [!IMPORTANT]
> ***This config requires latest [Neovim][Neovim] build !***

-   You can Set `NVIM_DEV` environment variable to modify where [**`lazy.nvim`**][Lazy.nvim]
    should look for `dev = true` plugins.

-   To install [**`treesitter`**][Treesitter] of `x` language Run `:TSInstall [x]` !
-   On [`NIX`][Nix] , run `nix develop` to enter a shell with `pwnvim` .
-   Install `lsp servers` and configure inside [**`servers.lua`**][Server].
-   See [**`:help lspconfig-all`**][Lspconfig] to get an understanding of how
    you would setup a language server protocol.
    ```lua
    -- plugins/servers.lua
    local lspconfig = require("lspconfig")

    -- $ rustup component add rust-analyzer
    lspconfig.rust_analyzer.setup({
      cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    })
    ```
  
<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2022 - present <a href="https://pwnwriter.xyz" target="_blank"> pwnwriter xyz<a> 🍃</a> 

[Neovim]: https://github.com/neovim/neovim
[Lazy.nvim]: https://github.com/folke/lazy.nvim
[Lspconfig]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
[Treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[Mason]: https://github.com/williamboman/mason.nvim
[Server]: /lua/plugins/servers.lua
[Nix]: https://github.com/NixOS/nix
