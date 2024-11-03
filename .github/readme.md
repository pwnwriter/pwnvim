<img width="1320" alt="Screenshot 2024-07-17 at 8 43 00 AM" src="https://github.com/user-attachments/assets/9d64acbe-96a6-4ace-ba37-4775dacfabf6">
<img width="1408" alt="Screenshot 2024-07-17 at 4 49 01 PM" src="https://github.com/user-attachments/assets/281f9779-094d-49f6-951f-dad4db63dce7">
<img width="1680" alt="Screenshot 2024-11-03 at 6 29 22 PM" src="https://github.com/user-attachments/assets/30946b30-9ad4-4e68-b98c-d5cce3171b2c">


----

```bash
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
-   Install `lsp servers` and configure inside [**`lsp.lua`**][LSP].
-   See [**`:help lspconfig-all`**][Lspconfig] to get an understanding of how
    you would setup a language server protocol.
    ```lua
    -- plugins/servers.lua
    local lspconfig = require("lspconfig")

    -- $ rustup component add rust-analyzer
    lspconfig.rust_analyzer.setup({
      cmd = { "rust-analyzer" },
    })
    ```
  
<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2022 - present <a href="https://pwnwriter.me" target="_blank"> pwnwriter me<a> 🍃</a> 

[Neovim]: https://github.com/neovim/neovim
[Lazy.nvim]: https://github.com/folke/lazy.nvim
[Lspconfig]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
[Treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[Mason]: https://github.com/williamboman/mason.nvim
[LSP]: /lua/plugins/lsp.lua
[Nix]: https://github.com/NixOS/nix
