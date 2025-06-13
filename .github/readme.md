<img width="1680" alt="Screenshot 2025-12-14 at 12 56 59 PM" src="https://github.com/user-attachments/assets/1d092671-9175-46ec-922b-4293b549b113" />


<img width="1680" alt="Screenshot 2025-12-14 at 12 57 41 PM" src="https://github.com/user-attachments/assets/4e0655f9-c590-4e11-bf63-a3c070cc2605" />


----

```bash
git clone https://github.com/pwnwriter/pwnvim ~/.config/nvim
nvim --headless +"Lazy! sync" +qa
```
---
```bash
nix develop github:pwnwriter/pwnvim
```

## 🍦 Tips

   
> [!IMPORTANT]
> ***This config requires latest [Neovim][Neovim] build !***

-   You can Set `NVIM_DEV` environment variable to modify where [**`lazy.nvim`**][Lazy.nvim]
    should look for `dev = true` plugins.

-   To install [**`treesitter`**][Treesitter] of `x` language Run `:TSInstall [x]` !
-   On [`NIX`][Nix] , run `nix develop` to enter a shell with `pwnvim` .
-   Install `lsp servers` and configure inside [**`lsp.lua`**][LSP].
-   See **`:h vim.lsp.config`** to get an understanding of how
    you would setup a language server protocol.
    ```lua
    -- plugins/lsp.lua
    vim.lsp.config.lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".git", vim.uv.cwd() },
      settings = {
        Lua = {
          telemetry = {
            enable = false,
          },
        },
      },
    }
    ```
  
<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2022 - present <a href="https://pwnwriter.me" target="_blank"> pwnwriter me<a> 🍃</a> 

[Neovim]: https://github.com/neovim/neovim
[Lazy.nvim]: https://github.com/folke/lazy.nvim
[Lspconfig]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
[Treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[Mason]: https://github.com/williamboman/mason.nvim
[LSP]: /lua/lsp.lua
[Nix]: https://github.com/NixOS/nix
