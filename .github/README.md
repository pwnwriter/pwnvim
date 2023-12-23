
![screenshot_2023-12-06_20-02-46](https://github.com/pwnwriter/pwnvim/assets/90331517/3da8df14-b6c4-4f80-8a61-46334712db43)


## ☕ Tips

-   FYI: This config requires `nvim` version `0.10`.
-   You can Set `NVIM_DEV` environment variable to modify where [lazy.nvim][lazy.nvim]
    should look for `dev = true` plugins.

-   To install tresitter of `x` language Run `:TSInstall [x]`.

-   See [**`:help lspconfig-all`**][lspconfig] to get an understanding of how
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
<p align="center">Copyright &copy; 2023<a href="https://pwnwriter.xyz" target="_blank"> pwnwriter xyz<a>🍀</a> 

[lazy.nvim]: https://github.com/folke/lazy.nvim
[lspconfig]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
