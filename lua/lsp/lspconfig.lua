-- lua/lsp/lspconfig.lua
-- Modern Neovim 0.11+ LSP setup

local util = require("lspconfig.util")

-- Define LSP server configs
vim.lsp.config["clangd"] = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

vim.lsp.config["pyright"] = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = util.root_pattern(".git", "pyproject.toml", ".", "setup.py"),
}

vim.lsp.config["bashls"] = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh" },
  root_dir = util.root_pattern(".git", "."),
}

vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "jsx", "tsx" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
}

vim.lsp.config["lua_ls"] = {
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
  root_dir = util.root_pattern(".git", "."),
}

-- Automatically start all servers when opening a matching buffer
for name, config in pairs(vim.lsp.config) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = config.filetypes or {},
    callback = function()
      vim.lsp.start(config)
    end,
  })
end

