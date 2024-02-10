return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = opts.sources or {}
    table.insert(opts.sources, nls.builtins.formatting.biome)
    table.insert(opts.sources, nls.builtins.formatting.buf)
    table.insert(opts.sources, nls.builtins.diagnostics.buf)
  end,
}
