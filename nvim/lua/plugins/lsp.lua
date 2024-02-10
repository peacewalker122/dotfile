return {
  -- tools
  {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
        "pyright",
        "clangd",
        "codelldb",
        "pyright",
        "ruff_lsp",
        "htmx-lsp",
        "html-lsp",
        "biome",
        "zls",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      ---@type lspconfig.options
      servers = {
        templ = {
          opts = {},
        },
        taplo = {
          ft = { "yaml", "toml" },
        },
        cssls = {
          ft = { "css", "scss", "less", "templ" },
          settings = {},
        },
        htmx = {
          ft = { "templ", "html" },
        },
        html = {
          ft = { "html", "templ", "tsx" },
        },
        gopls = {
          ft = { "templ", "go" },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Literal",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp" },
          root_dir = require("lspconfig").util.root_pattern("compile_flags.txt", ".git", "CMakeLists.txt"),
          init_options = {
            inlay_hints = {
              enabled = true,
              paramName = true,
            },
          },
          settings = {
            clangd = {},
            inlay_hints = {
              enable = true,
              enabled = true,
              paramName = true,
              paramType = true,
            },
          },
          on_attach = function(client, bufnr)
            client.server_capabilities.inlayHintProvider = true
            vim.g.inlay_hints_visible = true
          end,
        },
        biome = {
          ft = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescript.tsx", "typescriptreact" },
          root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
          single_file_support = true,
          cmd = { "biome", "lsp-proxy" },
        },
        zls = {
          ft = { "zig" },
          root_dir = require("lspconfig").util.root_pattern("build.zig", ".git"),
          cmd = { "zls" },
          settings = {
            inlay_hints = true,
          },
        },
        bufls = {
          filetypes = { "proto" },
          root_dir = require("lspconfig").util.root_pattern("buf.gen.yaml", "buf.work.yaml", ".git"),
          cmd = { "bufls", "serve" },
        },
        buf = {
          filetypes = { "proto" },
          root_dir = require("lspconfig").util.root_pattern("buf.gen.yaml", ".git", "buf.work.yaml"),
        },
        setup = {
          ruff_lsp = function()
            require("lazyvim.util").lsp.on_attach(function(client, _)
              if client.name == "ruff_lsp" then
                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false
              end
            end)
          end,
        },
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
}
