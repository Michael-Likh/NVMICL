local opts = { noremap = true, silent = true }

-- =========================
-- Plugins setup
-- =========================

-- Marks.nvim
require("marks").setup({
    default_mappings = true,
    excluded_filetypes = { "harpoon" },
})

-- Mini.comment
require("mini.comment").setup({
    options = {
        ignore_blank_line = true,
        start_of_line = false,
    }
})

-- ToggleTerm
require("toggleterm").setup({
    size = 10,
    open_mapping = "<M-t>",       -- Alt-t opens terminal
    direction = "horizontal",
    start_in_insert = true,
})

-- =========================
-- Navigation / Search
-- =========================

-- Telescope
vim.keymap.set("n", "<M-f>", function() vim.cmd("Telescope find_files") end, opts)
vim.keymap.set("n", "<M-g>", function() vim.cmd("Telescope live_grep") end, opts)

-- Harpoon
vim.keymap.set("n", "<M-h>", function()
    require("harpoon.ui").toggle_quick_menu()
end, opts)

vim.keymap.set("n", "<M-a>", function()
    require("harpoon.mark").add_file()
end, opts)

-- Flash
vim.keymap.set("n", "<M-j>", function()
    require("flash").jump()
end, opts)

-- Marks toggle
vim.keymap.set("n", "<M-m>", function()
    require("marks").toggle()
end, opts)

-- =========================
-- Mini.comment mappings
-- =========================

-- Normal mode: toggle current line
vim.keymap.set("n", "<M-/>", function()
    require("mini.comment").toggle()
end, opts)

-- Visual mode: toggle selected lines
vim.keymap.set("x", "<M-/>", function()
    require("mini.comment").toggle()
end, opts)

-- =========================
-- Copy/paste (Wayland)
-- =========================
vim.keymap.set("v", "<C-c>", '"+y', opts)
vim.keymap.set("n", "<C-v>", '"+p', opts)
vim.keymap.set("i", "<C-v>", '<C-r>+', opts)

-- =========================
-- ; as :
-- =========================
vim.keymap.set("n", ";", ":", opts)
vim.keymap.set("v", ";", ":", opts)

