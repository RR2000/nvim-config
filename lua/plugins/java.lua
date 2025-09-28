-- ~/.config/nvim/lua/plugins/java.lua
return {
  -- Treesitter parsers for Java and Spring config files
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "java", "yaml", "jproperties" })
    end,
  },

  -- Spring Boot plugin
  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    dependencies = {
      "mfussenegger/nvim-jdtls",  -- Java LSP
      "ibhagwan/fzf-lua",         -- optional fuzzy finder
    },
    opts = {},  -- default options
  },

  -- LSP configuration for Java using jdtls
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local ok, spring_boot = pcall(require, "spring_boot")
      if not ok then
        vim.notify("spring-boot.nvim not loaded", vim.log.levels.WARN)
        return
      end

      -- Initialize Spring Boot commands
      spring_boot.init_lsp_commands()

      opts.servers = opts.servers or {}
      opts.servers.jdtls = {
        init_options = {
          bundles = spring_boot.java_extensions(),
        },
      }
    end,
  },

  -- Mason tools for Java
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "google-java-format",
      },
    },
  },
}