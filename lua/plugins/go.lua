-- ~/.config/nvim/lua/plugins/go.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add Go-related parsers
      vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork" })
    end,
  },

  -- LSP configuration for Go
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {}, 
      },
    },
  },

  -- Install Go-related tools using Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",        -- Go LSP
        "golines",      -- code formatter
        "gofumpt",      -- strict code formatter
        "golangci-lint" -- linter
      },
    },
  },
}
