return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },

        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },

        json = { "prettier" },
        yaml = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },

        python = { "black" },

        rust = { "rustfmt" },

        go = { "gofmt" },

        c = { "clang_format" },
        cpp = { "clang_format" },
      },

      -- Auto format ao salvar
      format_on_save = function(bufnr)
        return {
          timeout_ms = 2000,
          lsp_fallback = true,
        }
      end,
    })
  end,
}

