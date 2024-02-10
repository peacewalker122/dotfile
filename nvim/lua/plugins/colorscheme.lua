return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    flavour = "macchiato",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    lazy = true,
    style = "modus_vivendi", -- Always use modus_operandi regardless of `vim.o.background`
    variant = "default", -- Use deuteranopia variant
    styles = {
      functions = { italic = true }, -- Enable italics for functions
    },
    dim_inactive = true,
  },
  {
    "bluz71/vim-moonfly-colors",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    opts = {},
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        terminal_colors = false,
        inverse = false,
      })
      -- overrides = {
      --   ["@lsp.type.method"] = { bg = "#ff9900" },
      --   ["@comment.lua"] = { bg = "#000000" },
      -- }
      -- vim.o.background = "dark"
      -- vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      -- vim.cmd("colorscheme github_dark_high_contrast")
    end,
  },
}
