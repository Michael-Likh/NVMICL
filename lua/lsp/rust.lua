-- lua/lsp/rust.lua
local rt = require("rust-tools")


local old_notify = vim.notify
vim.notify = function(msg, ...)
    if type(msg) == "string" and msg:match("require%(\'lspconfig\'%) \"framework\" is deprecated") then
        return
    end
    old_notify(msg, ...)
end


rt.setup({
    server = {
        -- on_attach: keymaps for rust actions
        on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            
            -- Hover actions
            vim.keymap.set("n", "<M-r>", rt.hover_actions.hover_actions, opts)
            
            -- Code action / run
            vim.keymap.set("n", "<M-a>", rt.code_action_group.code_action_group, opts)
            
            -- Code lens refresh
            vim.keymap.set("n", "<M-c>", function()
                vim.lsp.codelens.refresh()
                end, opts)
            end,

        -- Settings for rust-analyzer
        settings = {
            ["rust-analyzer"] = {
                cargo = { allFeatures = true },
                checkOnSave = { command = "clippy" },
                lens = { enable = true },  -- enable code lens
            }
        }
    },

    -- Debug adapter integration
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(
            '/usr/bin/codelldb',   -- path to codelldb
            '/usr/bin/liblldb.so'  -- path to liblldb
        )
    },
})

