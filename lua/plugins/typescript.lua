-- ~/.config/nvim/lua/plugins/react_native.lua
return {
  -- Treesitter parsers for JS/TS/React Native
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "typescript",
        "tsx",
        "jsx",
        "json",
        "html",
        "css",
      })
    end,
  },

  -- LSP setup for TypeScript / React Native
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git"),
          settings = {
            typescript = {
              inlayHints = { includeInlayParameterNameHints = "all" },
            },
            javascript = {
              inlayHints = { includeInlayParameterNameHints = "all" },
            },
          },
        },
        eslint = {
          root_dir = require("lspconfig.util").root_pattern(".eslintrc.js", ".eslintrc.json", "package.json", ".git"),
        },
      },
    },
  },

  -- Install formatting and linting tools via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",                  -- code formatter
        "eslint_d",                   -- linter
        "typescript-language-server", -- LSP server
      },
    },
  },
}
