-- lua/plugins/init.lua
return require("lazy").setup({

  -- Colorschemes, etc
  { "catppuccin/nvim", name = "catppuccin" },
  { "folke/tokyonight.nvim" },

  -- UI
  { "rebelot/heirline.nvim" },
  { 
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.buttons.val = {}  -- remove buttons
        dashboard.section.footer.val = {}
dashboard.section.header.val = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "__/\\\\\\_______/\\\\\\_        __/\\\\\\________/\\\\\\_        __/\\\\\\\\____________/\\\\\\\\_        __/\\\\\\\\\\\\\\\\\\\\\\_         _______/\\\\\\\\\\\\\\\\\\\\_          __/\\\\\\_____________        ",
    " _\\/\\\\\\\\\\____\\/\\\\\\_        _\\/\\\\\\_______\\/\\\\\\_        _\\/\\\\\\\\\\________/\\\\\\\\\\\\\\_        _\\/////\\\\\\///__         _____/\\\\\\////////__          _\\/\\\\\\_____________       ",
    "  _\\/\\\\\\/\\\\\\__\\/\\\\\\_        _\\//\\\\\\______/\\\\\\__        _\\/\\\\\\//\\\\\\____/\\\\\\//\\\\\\_        _____\\/\\\\\\_____         ___/\\\\\\/___________          _\\/\\\\\\_____________      ",
    "   _\\/\\\\\\//\\\\\\_\\/\\\\\\_        __\\//\\\\\\____/\\\\\\___        _\\/\\\\\\\\///\\\\\\/\\\\\\/\\\\\\\\\\\\_        _____\\/\\\\\\_____        __/\\\\\\_____________           _\\/\\\\\\_____________     ",
    "    _\\/\\\\\\\\//\\\\\\\\/\\\\\\_        ___\\//\\\\\\__/\\\\\\____        _\\/\\\\\\__\\///\\\\\\/___\\/\\\\\\_        _____\\/\\\\\\_____        _\\/\\\\\\_____________           _\\/\\\\\\_____________    ",
    "     _\\/\\\\\\_\\//\\\\\\/\\\\\\_        ____\\//\\\\\\/\\\\\\_____        _\\/\\\\\\____\\///_____\\/\\\\\\_        _____\\/\\\\\\_____        _\\//\\\\\\____________           _\\/\\\\\\_____________   ",
    "      _\\/\\\\\\__\\//\\\\\\\\\\\\_        _____\\//\\\\\\\\\\______        _\\/\\\\\\_____________\\/\\\\\\_        _____\\/\\\\\\_____       __\\///\\\\\\__________            _\\/\\\\\\_____________  ",
    "       _\\/\\\\\\___\\//\\\\\\\\\\_        ______\\//\\\\\\_______        _\\/\\\\\\_____________\\/\\\\\\_        __/\\\\\\\\\\\\\\\\\\\\\\_        ____\\////\\\\\\\\\\\\\\\\\\_           _\\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_ ",
    "        _\\///_____\\/////__        _______\\///________        _\\///______________\\///__        _\\///////////__        _______\\/////////__           _\\///////////////__     ",
    "",
    "",
    "",
    "                                                                             ┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓",
    "                                                                            ┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃  ",
    "                                                                             ╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹  ",
}



        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#8be9fd", bold = true })
        dashboard.section.header.opts.hl = "DashboardHeader"
        if vim.fn.argc() == 0 then
            alpha.setup(dashboard.config)
        end
    end
  },

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

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Terminal
  { "akinsho/toggleterm.nvim", lazy = false },
})


