local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.clipboard:append("unnamedplus")
--vim.api.nvim_set_option("clipboard", "unnamedplus"))

opt.undofile = true
opt.hlsearch = true
