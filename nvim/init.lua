require "plugins"
require "options"

vim.opt.termguicolors = true

vim.cmd [[colorscheme cmyk-colourrrs]]
vim.cmd [[set number]]

require'lspconfig'.rust_analyzer.setup({})
