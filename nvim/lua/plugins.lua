local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- File explorer
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate", 
    config = function()
      require "nvim-treesitter".setup()
  
      require 'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        }
      }
    end
  }

  -- use {
  --   'nvim-telescope/telescope.nvim', tag = '0.1.0',
  --   requires = { {'nvim-lua/plenary.nvim'} }
  -- }

  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  
  use "kyazdani42/nvim-web-devicons"
  
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require("null-ls").setup({
        sources = {
            require("null-ls").builtins.formatting.stylua,
            require("null-ls").builtins.diagnostics.eslint,
            -- require("null-ls").builtins.completion.tags,
            -- require("null-ls").builtins.completion.luasnip,
            -- require("null-ls").builtins.completion.vsnip,
        },
      })
    end
  }

  use { 
    "williamboman/mason.nvim",
    config = function() 
      require("mason").setup({})
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() 
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt" , "vim" },
      })
    end
  }

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Themes
  use "techygrrrl/techygrrrl-cmyk-colourrrs-neovim"

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end
  }

  use "alec-gibson/nvim-tetris"

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
} 
end)
