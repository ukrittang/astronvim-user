local config = {
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
      ensure_installed = { "sumneko_lua", "tsserver", "tailwindcss", "pylsp" },
    },
    ["mason-null-ls"] = {
      ensure_installed = { "prettierd", "eslint_d", "stylua", "black", "isort", "gdformat" },
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
      filter = function(client)
        -- only enable null-ls for gdscript files
        if
          vim.bo.filetype == "gd"
          or vim.bo.filetype == "gdscript"
          or vim.bo.filetype == "gdscript3"
          or vim.bo.filetype == "gdscript4"
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
