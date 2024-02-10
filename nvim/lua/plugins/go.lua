return {
  {
    "ray-x/go.nvim",
    -- enabled = false,
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        lsp_inlay_hints = {
          enable = false,
        },
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod", "templ" },
    keys = {
      { "<leader>gsj", "<cmd> GoAddTag json <cr>", desc = "Add Json Tag" },
      { "<leader>gsd", "<cmd> GoDoc <cr>", desc = "Open GoDoc Under Cursor" },
      { "<leader>gsf", "<cmd> GoFillStruct <cr>", desc = "Fill Struct" },
      -- {"<leader>gsi", "<cmd> GoImpl <cr>", desc = "Generate Interface"},
    },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {},
}
