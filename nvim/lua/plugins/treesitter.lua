return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "go",
      "gomod",
      "gowork",
      "gosum",
      "python",
      "rst",
      "toml",
      "c",
      "sql",
      "query",
      "json",
      "templ",
      "toml",
      "yaml",
      "zig",
    })
  end,
}
