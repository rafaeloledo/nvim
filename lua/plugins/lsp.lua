return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local status, nvim_lsp = pcall(require, "lspconfig")
      if (not status) then return end

      local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
      local enable_format_on_save = function(_, bufnr)
        vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup_format,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end


      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        local opts = { noremap = true, silent = true }

        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      nvim_lsp.flow.setup {
        on_attach = on_attach,
        capabilities = capabilities
      }

      nvim_lsp.rust_analyzer.setup {}

      nvim_lsp.tsserver.setup {
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact",
          "javascript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities
      }

      nvim_lsp.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      nvim_lsp.jdtls.setup {}

      nvim_lsp.kotlin_language_server.setup {}

      nvim_lsp.lua_ls.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          enable_format_on_save(client, bufnr)
        end,
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false
            },
          },
        },
      }

      nvim_lsp.cssls.setup {
        on_attach = on_attach,
        capabilities = capabilities
      }

      nvim_lsp.pyright.setup {}

      nvim_lsp.astro.setup {
        on_attach = on_attach,
        capabilities = capabilities
      }

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          update_in_insert = false,
          virtual_text = { spacing = 4, prefix = "●" },
          severity_sort = true,
        }
      )

      local signs = { Error = "", Warn = " ", Hint = "", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        virtual_text = {
          prefix = '●'
        },
        update_in_insert = true,
        float = {
          source = "always", -- Or "if_many"
        },
      })
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      local status, saga = pcall(require, "lspsaga")
      if (not status) then return end

      saga.setup({
        ui = {
          border = 'rounded',
        },
        symbol_in_winbar = {
          enable = false
        },
        lightbulb = {
          enable = false
        },
        outline = {
          layout = 'float'
        }
      })

      local diagnostic = require("lspsaga.diagnostic")
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
      vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
      vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
      vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
      vim.keymap.set('n', 'gt', '<Cmd>Lspsaga goto_type_definition<CR>', opts)
      -- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
      vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
      vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

      -- code action
      vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    end
  },
  {
    'dinhhuy258/git.nvim',
    config = function()
      local status, git = pcall(require, "git")
      if (not status) then return end

      git.setup({
        keymaps = {
          -- Open blame window
          blame = "<Leader>gb",
          -- Open file/folder in git repository
          browse = "<Leader>go",
        }
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
    init = function()
      local status, autopairs = pcall(require, "nvim-autopairs")
      if (not status) then return end

      autopairs.setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end
  },
  {
    'windwp/nvim-ts-autotag',
    init = function()
      local status, autotag = pcall(require, "nvim-ts-autotag")
      if (not status) then return end

      autotag.setup({})
    end
  },
  {
    'onsails/lspkind-nvim',
    config = function()
      local status, lspkind = pcall(require, "lspkind")
      if (not status) then return end

      lspkind.init({
        mode = 'symbol_text',
        preset = 'codicons',
        symbol_map = {
          Text = "󰉿 (Text)",
          Method = "󰆧 (Method)",
          Function = "󰊕 (Function)",
          Constructor = " (Constructor)",
          Field = "󰜢 (Field)",
          Variable = "󰀫 (Variable)",
          Class = "󰠱 (Class)",
          Interface = " (Interface)",
          Module = " (Module)",
          Property = "󰜢 (Property)",
          Unit = "󰑭 (Unit)",
          Value = "󰎠 (Value)",
          Enum = " (Enum)",
          Keyword = "󰌋 (Keyword)",
          Snippet = " (Snippet)",
          Color = "󰏘 (Color)",
          File = "󰈙 (File)",
          Reference = "󰈇 (Reference)",
          Folder = "󰉋 (Folder)",
          EnumMember = " (EnumMember)",
          Constant = "󰏿 (Constant)",
          Struct = "󰙅 (Struct)",
          Event = " (Event)",
          Operator = "󰆕 (Operator)",
          TypeParameter = " (TypeParameter)",
        },
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local status, ts = pcall(require, "nvim-treesitter.configs")
      if (not status) then return end

      ts.setup {
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        indent = {
          enable = true,
          disable = {},
        },
        ensure_installed = {
          "markdown",
          "markdown_inline",
          "kotlin",
          "tsx",
          "javascript",
          "toml",
          "fish",
          "php",
          "json",
          "yaml",
          "java",
          "swift",
          "css",
          "rust",
          "c",
          "html",
          "lua"
        },
        autotag = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        }
      }

      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
    end
  },
  {
    'williamboman/mason.nvim',
    init = function()
      local status, mason = pcall(require, "mason")
      if (not status) then return end

      mason.setup({ {} })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    init = function()
      local status2, lspconfig = pcall(require, "mason-lspconfig")
      if (not status2) then return end

      lspconfig.setup {
        -- automatic_installation = true
      }
    end
  },
  {
    'mfussenegger/nvim-jdtls',
    lazy = true,
    config = function()
      local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

      local jar_path_linux = '/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar'
      local jar_path_windows =
      'C:\\Users\\rafae\\scoop\\apps\\jdtls\\current\\plugins\\org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar'

      local config = {
        cmd = {
          'java',
          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.protocol=true',
          '-Dlog.level=ALL',
          '-Xms1g',
          '--add-modules=ALL-SYSTEM',
          '--add-opens', 'java.base/java.util=ALL-UNNAMED',
          '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
          '-jar', jar_path_windows,
          '-configuration', '/usr/share/java/jdtls/config_linux',
          '-data', vim.fn.expand('~/.cache/jdtls-workspace') .. workspace_dir,
        },
        root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
        settings = {
          java = {
          }
        },
        init_options = {
          bundles = {}
        },
      }

      require('jdtls').start_or_attach(config)
    end
  },
  { 'nvimtools/none-ls.nvim' },
}
