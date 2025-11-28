-- lua/plugins/init.lua
return require("lazy").setup({

  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin" },
  { "folke/tokyonight.nvim" },

  -- UI
  { "rebelot/heirline.nvim" },

  -- Navigation / Bookmarks
  { "theprimeagen/harpoon" },
  { "chentoast/marks.nvim" },
  { "folke/flash.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },

  -- Editing
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "echasnovski/mini.nvim" },
  { "windwp/nvim-autopairs" },

  -- LSP / Rust
  { "neovim/nvim-lspconfig", lazy = false },
  { "glepnir/lspsaga.nvim" },
  { "simrat39/rust-tools.nvim" },
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },

  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },       -- buffer words
  { "hrsh7th/cmp-path" },         -- file paths
  { "L3MON4D3/LuaSnip" },         -- snippet engine
  { "saadparwaiz1/cmp_luasnip" }, -- snippets source

  -- Terminal
  { "akinsho/toggleterm.nvim", lazy = false },
})



