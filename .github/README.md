<h3 align="center"><img src="https://github.com/pwnwriter/pwnvim/blob/images/logos/pwnvim-logo-12622-crop.png" width="300px" height="180px" ></h3>

<p align="center">
<a href="https://github.com/pwnwriter/pwnvim"><img src="https://img.shields.io/badge/Neovim-0.9.0-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim"></a>
<a href="https://github.com/pwnwriter/pwnvim/issues"><img src="https://img.shields.io/github/issues/pwnwriter/pwnvim.svg?style=flat-square&label=Issues&color=d77982"></a>
<a href="https://github.com/pwnwriter/pwnwriter/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-white.svg" alt="MIT LICENSE"></a>
<a href="https://ko-fi.com/pwnwriter"><img src="https://img.shields.io/badge/support-pwnwriter%20-pink?logo=kofi&logoColor=white" alt="Ko-fi"></a>
<br>
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600" />
</p>

[`Pwn(nvim)`](/) is a neovim config living by the [`KISS`](https://en.wikipedia.org/wiki/KISS_principle) philosophy. Crafted using pure Lua, it blends high performance, pleasing aesthetics, and maximum productivity. Right from the start, you get it all out of the box, ⊱ ─── ⊰ carefully loaded plugins and a snappy startup time `<25ms` 

## 📔 Table of contents 

* [`Features`](#features)
* [`Requirements`](#requirements)
* [`Installation`](#installation)
* [`Tips`](#tips)
* [`Showcase`](#showcase)
* [`License`](#license)
</div>


<a name="features"></a>
## 🦄 Features

**𝒘𝒉𝒂𝒕𝒔𝒐𝒆𝒗𝒆𝒓 𝒂 𝒎𝒂𝒏 𝒔𝒐𝒘𝒆𝒕𝒉, 𝒕𝒉𝒂𝒕 𝒔𝒉𝒂𝒍𝒍 𝒉𝒆 𝒂𝒍𝒔𝒐 𝒓𝒆𝒂𝒑**

<details><summary> <b>Features (Click to expand!)</b></summary>

- **mini.files**:- Fast file tree, edit like a buffer and more

![mini-files](https://github.com/pwnwriter/pwnvim/assets/90331517/e411196d-1617-4303-9a43-29efa15c2066)


- **Lsp**:- Well configured env for lsp servers

![](https://github.com/pwnwriter/pwnvim/blob/images/features/lsp.png)

- **mini.pick**:- A fuzzy file finder, picker, sorter, previewer and a lot more

![mini-pick](https://github.com/pwnwriter/pwnvim/assets/90331517/337c06d6-3a9c-45be-9f0c-8ca1a9b36037)


- **Nostatusline**:- Not using statusline, coz everything can be seen with noice :P 

![](https://github.com/pwnwriter/pwnvim/blob/images/features/statusline.png)
![noice](https://github.com/pwnwriter/pwnvim/assets/90331517/97be8cf7-e623-4fbb-a667-1be23e8e85e6)


Actually there's a lot you can explore, you may want to discover its array of features by installing and exploring pwnvim yourself.

</details>


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

<a name="requirements"></a>
## ⚡ Requirements

-   🍺 Get yourself a fresh install of [`Neovim`](https://neovim.io).

-   🚀 Use a [`Nerd Fonts`](https://nerdfonts.com/) within your terminal.

-   🔍 Install [`fd-find`](https://github.com/sharkdp/fd) and [`ripgrep`](https://github.com/BurntSushi/ripgrep) through your package manager.

-   🐙 Setup [`git`](https://en.wikipedia.org/wiki/Git) if you haven't already.

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)


<a name="installation"></a>
## 📩 Installation
**𝒀𝒐𝒖 𝒓𝒆𝒂𝒑 𝒘𝒉𝒂𝒕 𝒚𝒐𝒖 𝒔𝒐𝒘**
- Take backup (optional)
 
 ```bash
mv ~/.config/nvim{,-backup}
mv ~/.cache/nvim{,-backup}
mv ~/.local/share/nvim{,-backup}
mv ~/.local/state/nvim{,-backup}
 ```
- Install pwnvim using `NVIM_APPNAME`

```bash
export NVIM_APPNAME="pwnvim" # This line must be in your shellrc 
git clone https://github.com/pwnwriter/pwnvim.git ~/.config/$NVIM_APPNAME
nvim --headless +q
```

- Install the standard way

```bash
git clone https://github.com/pwnwriter/pwnvim.git --depth=1 ~/.config/nvim && nvim --headless +q
```
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)


<a name="tips"></a>
## ☕ Tips

-   You can Set `NVIM_DEV` environment variable to modify where [lazy.nvim][lazy.nvim]
    should look for `dev = true` plugins.

-   To install tresitter of `x` language Run `:TSInstall [x]`.

-   See [`:help lspconfig-all`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) to get an understanding of how
    you would setup a language server protocol.

    ```lua
    -- plugins/configs/servers.lua
    local lspconfig = require("lspconfig")

    -- $ rustup component add rust-analyzer
    lspconfig.rust_analyzer.setup({
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
    })
    ```


<a name="showcase"></a>
## ❤️‍🩹 Showcase

<details><summary> <b>Images (Click to expand!)</b></summary>
 
![](https://github.com/pwnwriter/pwnvim/blob/images/showcase/113881.png)

![](https://github.com/pwnwriter/pwnvim/blob/images/showcase/157639.png)

![lazy-loaded](https://github.com/pwnwriter/pwnvim/assets/90331517/bd122c6d-8836-4e2e-8c97-c0a8cf96f79e)



</details>

   
<a name="license"></a> 
## 🔐 License
 Licensed under the [**`MIT LICENSE`**](/LICENSE) 
  
<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2023<a href="https://pwnwriter.xyz" target="_blank"> pwnwriter xyz<a>🍀 </a> 




