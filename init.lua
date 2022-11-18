local config = {
  updated = {
    channel = "stable",
  },
  -- Set colorscheme
  plugins = {
    init = { { "catppuccin/nvim", as = "catppuccin" } },
    treesitter = { -- overrides `require("treesitter").setup(...)`
      ensure_installed = {
        "lua",
        "typescript",
        "tsx",
        "javascript",
        "json",
        "html",
        "css",
        "python",
        "yaml",
        "gdscript",
      },
      rainbow = { enable = false },
    },
    ["mason-lspconfig"] = {
      ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver", "tailwindcss", "pylsp" },
    },
    ["mason-null-ls"] = {
      ensure_installed = { "prettierd", "stylua" },
    },
    indent_blankline = {
      show_current_context = false,
    },
  },
  options = {
    g = {
      catppuccin_flavour = "mocha",
    },
  },
  colorscheme = "catppuccin",

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      "gdscript",
    },
    formatting = {
      format_on_save = true,
      timeout_ms = 4800,
      filter = function(client)
        -- only enable null-ls for gdscript files
        if
          vim.bo.filetype == "gd"
          or vim.bo.filetype == "gdscript"
          or vim.bo.filetype == "gdscript3"
          or vim.bo.filetype == "gdscript4"
          or vim.bo.filetype == "typescript"
          or vim.bo.filetype == "typescriptreact"
          or vim.bo.filetype == "javascript"
          or vim.bo.filetype == "javascriptreact"
          or vim.bo.filetype == "json"
          or vim.bo.filetype == "jsonc"
          or vim.bo.filetype == "markdown"
        then
          return client.name == "null-ls"
        end

        -- enable all other clients
        return true
      end,
    },
  },
}

return config
