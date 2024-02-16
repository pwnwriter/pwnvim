![screenshot_2023-12-23_19-00-07](https://github.com/pwnwriter/pwnvim/assets/90331517/10fb5d7f-8be5-477b-9e37-a20fb36d6ebb)

<p align="center">
    Some of us don't give a shit how lean our <code>vimrc</code> is. What an arbitrary yardstick.<br />
     I prioritize minimizing the bloat.<br />
</p>
<p align="center">
    <sup> Requires version: v0.10.{..}</sup> <!-- Current-Neovim-version -->
</p>

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
    -- plugins/configs/servers.lua
    local lspconfig = require("lspconfig")

    -- $ rustup component add rust-analyzer
    lspconfig.rust_analyzer.setup({
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
    })
    ```
  
<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2022 - present <a href="https://pwnwriter.xyz" target="_blank"> pwnwriter xyz<a> 🍃</a> 

[Neovim]: https://github.com/neovim/neovim
[Lazy.nvim]: https://github.com/folke/lazy.nvim
[Lspconfig]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
[Treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[Mason]: https://github.com/williamboman/mason.nvim
[Server]: /lua/plugins/configs/servers.lua
[Nix]: https://github.com/NixOS/nix