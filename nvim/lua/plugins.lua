local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
  -- welcom neovim
  use "goolord/alpha-nvim"
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/plenary.nvim"
  -- Use tokyonight scheme
  use 'folke/tokyonight.nvim'
  -- Use nvim-tree
  use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
  --use buffer-line
  use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
  }
  --use telescope
  -- Telescope
  use "nvim-telescope/telescope-live-grep-args.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  --use nvim-treesitter
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate' }
  --colorscheme
  use { "catppuccin/nvim", as = "catppuccin" }

  use 'navarasu/onedark.nvim'
  --LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "ray-x/lsp_signature.nvim" -- show function signature when typing

  --cmp
    use {
    "hrsh7th/nvim-cmp",
    -- commit = "4f1358e659d51c69055ac935e618b684cf4f1429",
  } -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  -- use which-key
  use "folke/which-key.nvim"
end)
