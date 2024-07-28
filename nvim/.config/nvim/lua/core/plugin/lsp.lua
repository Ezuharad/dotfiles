-- LSP configuration
return {
  {
    "williamboman/mason.nvim",
    config = true,
    opts = {
      ui = {
        border = "single",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            handlers = require(
              "core.plugin.lsp.handler"),
            settings = require("core.plugin.lsp.settings")
          })
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    keys = { { "<leader>rn", vim.lsp.buf.rename, desc = "Rename Token" },
      { "<leader>ra", vim.lsp.buf.code_action,    desc = "Code Actions" },
      { "<leader>rs", vim.lsp.buf.signature_help, desc = "Signature Help" }
    }
  },
}