return {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    css = { "prettier" },
  },

  format_on_save = {
    -- these options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
