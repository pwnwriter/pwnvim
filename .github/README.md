![screenshot_2023-12-23_19-00-07](https://github.com/pwnwriter/pwnvim/assets/90331517/10fb5d7f-8be5-477b-9e37-a20fb36d6ebb)


## 🍦 Tips

   
> [!IMPORTANT]
> ***This config requires Latest [Neovim][Neovim] build !***

-   You can Set `NVIM_DEV` environment variable to modify where [**`lazy.nvim`**][lazy.nvim]
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
<p align="center">Copyright &copy; 2023<a href="https://pwnwriter.xyz" target="_blank"> pwnwriter xyz<a> 🍃</a> 

[Neovim]: https://github.com/neovim/neovim
[lazy.nvim]: https://github.com/folke/lazy.nvim
[lspconfig]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
