-- Bootstrap lazy.nvim if not already

local function bootstrapLazyNvim()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        print("Waittt, bootstrapping lazy.nvim ...")
        vim.fn.system(
            {
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath
            }
        )
    end
    vim.opt.rtp:prepend(lazypath)
end

bootstrapLazyNvim()

