return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      cmd = { "Mason", "MasonInstall", "MasonUpdate" }
    },
    {
      "williamboman/mason-lspconfig.nvim",
      after = "mason.nvim",
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",  -- Load `nvim-cmp` when entering Insert mode
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        {
          "Saecki/crates.nvim",
          event = "BufRead Cargo.toml",  -- Lazy-load `crates.nvim` when reading Cargo.toml
          opts = {
            completion = {
              cmp = { enabled = true },
            }
          },
        }
      }
    },
      {
        "L3MON4D3/LuaSnip",
        event = "InsertCharPre",  -- Lazy-load `LuaSnip` on the first character input
      },
      {
        "saadparwaiz1/cmp_luasnip",
        after = "nvim-cmp",  -- Load after `nvim-cmp` to integrate with `cmp`
      },
      {
        "j-hui/fidget.nvim",
        event = "LspAttach",  -- Load `fidget.nvim` on the first LSP attachment
      },
    },

    config = function()
      local cmp = require('cmp')
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "clangd",
          "tsserver",
          "html",
          "cssls",
          "svelte",
          "templ",
          "tailwindcss",
          "phpactor",
          "htmx",
          "jsonls",
          "csharp_ls",
        },
        handlers = {
          function(server_name) -- default handler (optional)

            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,

          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = { version = "Lua 5.1" },
                  diagnostics = {
                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                  }
                }
              }
            }
          end,

          ["phpactor"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.phpactor.setup {
              capabilities = capabilities,
              root_dir = function()
                -- Set a broader root directory
                return vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h")
              end,
              -- Add any additional phpactor-specific settings here
              settings = {
                phpactor = {
                  -- Optional: Adjust or add settings for better performance
                  completion = {
                    -- Example setting for completion
                    enable = true,
                  },
                },
              },
            }
          end,
        }
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
          })
      })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end
  }
