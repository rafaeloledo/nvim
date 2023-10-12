return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local status, nvim_lsp = pcall(require, "lspconfig")
      if (not status) then return end

      local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        --Enable completion triggered by <c-x><c-o>
        --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      end

      -- Set up completion using nvim_cmp with LSP source
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      nvim_lsp.flow.setup {
        on_attach = on_attach,
        capabilities = capabilities
      }

      nvim_lsp.rust_analyzer.setup {}

      nvim_lsp.tsserver.setup {
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities
      }

      -- only for macos
      -- nvim_lsp.sourcekit.setup {
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      -- }

      nvim_lsp.clangd.setup {}

      nvim_lsp.jdtls.setup {}

      nvim_lsp.kotlin_language_server.setup {}

      nvim_lsp.lua_ls.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
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

      --nvim_lsp.tailwindcss.setup {
      --  on_attach = on_attach,
      --  capabilities = capabilities
      --}

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

      -- Diagnostic symbols in the sign column (gutter)
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
          source = "always",           -- Or "if_many"
        },
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local status, cmp = pcall(require, "cmp")
      if (not status) then return end
      local lspkind = require 'lspkind'
      local luasnip = require("luasnip")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and
            vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local function formatForTailwindCSS(entry, vim_item)
        if vim_item.kind == 'Color' and entry.completion_item.documentation then
          local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
          if r then
            local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
            local group = 'Tw_' .. color
            if vim.fn.hlID(group) < 1 then
              vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
            end
            vim_item.kind = "●"
            vim_item.kind_hl_group = group
            return vim_item
          end
        end
        vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
        return vim_item
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            before = function(entry, vim_item)
              vim_item = formatForTailwindCSS(entry, vim_item)
              return vim_item
            end
          })
        }
      })

      vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
    end
  },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'L3MON4D3/LuaSnip' },
  { 'nvimdev/lspsaga.nvim' },
  { 'dinhhuy258/git.nvim' },
  { 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag' },
  {
    'onsails/lspkind-nvim',
    config = function()
      local status, lspkind = pcall(require, "lspkind")
      if (not status) then return end

      lspkind.init({
        -- DEPRECATED (use mode instead): enables text annotations
        --
        -- default: true
        -- with_text = true,

        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = 'symbol_text',

        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'codicons',

        -- override preset symbols
        --
        -- default: {}
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
            local max_filesize = 100 * 1024             -- 100 KB
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
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'mfussenegger/nvim-jdtls' },
  { 'nvimtools/none-ls.nvim' },
}
