<img width="1440" alt="Screenshot 2024-02-26 at 9 29 20 PM" src="https://github.com/pwnwriter/pwnvim/assets/90331517/e0701963-ba54-4951-98cb-44e1fca10a94">

<p align="center">
    Some of us don't give a shit how lean our <code>vimrc</code> is. What an arbitrary yardstick.<br />
     I prioritize minimizing the bloat.<br />
</p>
<p align="center">
    <sup> Requires version: v0.10.{..}</sup> <!-- Current-Neovim-version -->
</p>

## Install 💧
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
