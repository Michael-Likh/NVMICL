local heirline = require("heirline")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- ============================
--  CATPPUCCIN MOCHA COLORS
-- ============================
local C = {
    fg       = "#CDD6F4",
    bg       = "#1E1E2E",
    blue     = "#89B4FA",
    lavender = "#B4BEFE",
    red      = "#F38BA8",
    yellow   = "#F9E2AF",
    green    = "#A6E3A1",
    teal     = "#94E2D5",
    mauve    = "#CBA6F7",
    peach    = "#FAB387",
}

local Space = { provider = " " }

-- MODE BLOCK (pretty)
local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,
    static = {
        mode_names = {
            n = "NORMAL",
            no = "OP-PENDING",
            i = "INSERT",
            v = "VISUAL",
            V = "V-LINE",
            ["\22"] = "V-BLOCK",
            c = "COMMAND",
            s = "SELECT",
            S = "S-LINE",
            ["\19"] = "S-BLOCK",
            R = "REPLACE",
            r = "REPLACE",
            t = "TERMINAL",
        },
        mode_colors = {
            n = C.blue,
            i = C.green,
            v = C.peach,
            V = C.peach,
            ["\22"] = C.peach,
            c = C.mauve,
            r = C.red,
            R = C.red,
            t = C.teal,
        },
    },
    provider = function(self)
        local m = self.mode:sub(1,1)
        return " 󰣇  " .. self.mode_names[m] .. " "
    end,
    hl = function(self)
        local m = self.mode:sub(1,1)
        return { fg = C.bg, bg = self.mode_colors[m], bold = true }
    end,
}

-- FILE NAME + PATH
local FileName = {
    provider = function()
        local name = vim.fn.expand("%:t")
        return name ~= "" and (" " .. name .. " ") or " [No Name] "
    end,
    hl = { fg = C.fg },
}

-- FILE PERCENTAGE
local FilePercent = {
    provider = " %p%% ",
    hl = { fg = C.lavender },
}

-- GIT BLOCK
local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.head = vim.b.gitsigns_head or ""
    end,

    {
        provider = function(self)
            if self.head ~= "" then
                return "  " .. self.head .. " "
            end
            return ""
        end,
        hl = { fg = C.mauve },
    },
}

-- DIAGNOSTICS
local Diagnostics = {
    condition = conditions.has_diagnostics,
    provider = function()
        local e = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        local w = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        local h = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        local i = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        local out = ""

        if e > 0 then out = out .. " " .. e .. " " end
        if w > 0 then out = out .. " " .. w .. " " end
        if h > 0 then out = out .. " " .. h .. " " end
        if i > 0 then out = out .. " " .. i .. " " end

        return out
    end,
    hl = { fg = C.red },
}

-- LSP STATUS (attached? + name)
local LSP = {
    provider = function()
        local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #buf_clients == 0 then return "" end
        local names = {}
        for _, client in pairs(buf_clients) do
            table.insert(names, client.name)
        end
        return "  " .. table.concat(names, ", ") .. " "
    end,
    hl = { fg = C.green },
}

-- SCROLLBAR (cool af)
local ScrollBar = {
    provider = function()
        local curr = vim.fn.line(".")
        local total = vim.fn.line("$")
        local chars = { "▁","▂","▃","▄","▅","▆","▇","█" }
        local i = math.floor((curr / total) * #chars)
        return " " .. chars[math.max(i, 1)] .. " "
    end,
    hl = { fg = C.blue },
}

-- FINAL STATUSLINE
heirline.setup({
    statusline = {
        ViMode,
        Space,

        FileName,
        Git,
        Space,

        Diagnostics,

        -- Right side
        { provider = "%=" },

        LSP,
        Space,

        FilePercent,
        ScrollBar,
    }
})

