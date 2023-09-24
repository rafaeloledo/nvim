diff --git a/after/plugin/orgmode.rc.lua b/after/plugin/orgmode.rc.lua
deleted file mode 100644
index b551bf6..0000000
--- a/after/plugin/orgmode.rc.lua
+++ /dev/null
@@ -1,19 +0,0 @@
--- https://github.com/nvim-orgmode/orgmode
-
--- Load custom treesitter grammar for org filetype
-local orgmode = require('orgmode')
-
-orgmode.setup_ts_grammar()
-
--- Treesitter configuration
-require('nvim-treesitter.configs').setup {
-  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
-  -- highlighting will fallback to default Vim syntax highlighting
-  highlight = {
-    enable = true,
-    -- Required for spellcheck, some LaTex highlights and
-    -- code block highlights that do not have ts grammar
-    additional_vim_regex_highlighting = { 'org' },
-  },
-  ensure_installed = { 'org' }, -- Or run :TSUpdate org
-}
diff --git a/after/plugin/rosepine.rc.lua b/after/plugin/rosepine.rc.lua
deleted file mode 100644
index 8a1f624..0000000
--- a/after/plugin/rosepine.rc.lua
+++ /dev/null
@@ -1,2 +0,0 @@
---require('rose-pine').setup({})
---vim.cmd('colorscheme rose-pine')
diff --git a/after/plugin/telescope.rc.lua b/after/plugin/telescope.rc.lua
index cee31c8..75f1999 100644
--- a/after/plugin/telescope.rc.lua
+++ b/after/plugin/telescope.rc.lua
@@ -1,96 +1,12 @@
--- https://github.com/nvim-telescope/telescope.nvim
-
-local status, telescope = pcall(require, "telescope")
-if (not status) then return end
-local actions = require('telescope.actions')
-local builtin = require("telescope.builtin")
-
-local function telescope_buffer_dir()
-  return vim.fn.expand('%:p:h')
+local status, builtin = pcall(require, "telescope.builtin")
+if (not status) then
+  return
 end
 
-local fb_actions = require "telescope".extensions.file_browser.actions
-
-telescope.setup {
-  defaults = {
-    mappings = {
-      n = {
-        ["q"] = actions.close
-      },
-    },
-  },
-  extensions = {
-    file_browser = {
-      hidden = true,
-      hijack_netrw = true,
-      respect_gitignore = false,
-      theme = "dropdown",
-      initial_mode = "normal",
-      mappings = {
-        ["i"] = {
-          ["<C-w>"] = function() vim.cmd('normal vbd') end,
-        },
-        ["n"] = {
-          ["n"] = fb_actions.create,
-          ["p"] = fb_actions.goto_parent_dir,
-          ["h"] = fb_actions.goto_cwd,
-          ["/"] = function()
-            vim.cmd('startinsert')
-          end,
-          ["<C-u>"] = function(prompt_bufnr)
-            for i = 1, 10 do actions.move_selection_previous(prompt_bufnr) end
-          end,
-          ["<C-d>"] = function(prompt_bufnr)
-            for i = 1, 10 do actions.move_selection_next(prompt_bufnr) end
-          end,
-          ["<PageUp>"] = actions.preview_scrolling_up,
-          ["<PageDown>"] = actions.preview_scrolling_down,
-        },
-      },
-    },
-  },
-}
-
-
-telescope.load_extension("file_browser")
 local keymap = vim.keymap
 
-keymap.set('n', ';f', function()
-  builtin.find_files({
-    no_ignore = false,
-    hidden = false
-  })
-end)
-
+keymap.set('n', ';f', builtin.find_files, {})
 keymap.set('n', ';r', function()
   builtin.live_grep()
 end)
-
-keymap.set('n', '\\\\', function()
-  builtin.buffers()
-end)
-
-keymap.set('n', ';t', function()
-  builtin.help_tags()
-end)
-
-keymap.set('n', ';;', function()
-  builtin.resume()
-end)
-
-keymap.set('n', ';e', function()
-  builtin.diagnostics()
-end)
-
-keymap.set("n", "sf", function()
-  telescope.extensions.file_browser.file_browser({
-    path = "%:p:h",
-    cwd = telescope_buffer_dir(),
-    respect_gitignore = false,
-    hidden = true,
-    grouped = true,
-    previewer = true,
-    initial_mode = "normal",
-    layout_config = { height = 24 }
-  })
-end)
+keymap.set("n", "sf", builtin.git_files, {})
diff --git a/ftplugin/java.lua b/ftplugin/java.lua
index 70945ff..02a19e5 100644
--- a/ftplugin/java.lua
+++ b/ftplugin/java.lua
@@ -25,7 +25,7 @@ local config = {
     bundles = {}
   },
 }
+
 require('jdtls').start_or_attach(config)
-require('lspconfig').jdtls.setup {
 
-}
+require('lspconfig').jdtls.setup {}
diff --git a/init.lua b/init.lua
index 687c1ee..dcb9618 100644
--- a/init.lua
+++ b/init.lua
@@ -9,3 +9,5 @@ require('rafaelledo.base')
 require('rafaelledo.highlights')
 require('rafaelledo.maps')
 require('rafaelledo.plugins')
+
+vim.cmd [[highlight Cursor guibg=white guifg=black]]
diff --git a/lua/rafaelledo/plugins.lua b/lua/rafaelledo/plugins.lua
index 1757f4b..8a21630 100644
--- a/lua/rafaelledo/plugins.lua
+++ b/lua/rafaelledo/plugins.lua
@@ -25,7 +25,7 @@ require('packer').startup(function(use)
     run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
   }
   use 'nvim-telescope/telescope.nvim'
-  use 'nvim-telescope/telescope-file-browser.nvim'
+  use { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" }
   use 'windwp/nvim-autopairs'
   use 'windwp/nvim-ts-autotag'
   use 'norcalli/nvim-colorizer.lua'
@@ -34,17 +34,12 @@ require('packer').startup(function(use)
     run = function() vim.fn["mkdp#util#install"]() end,
   })
   use 'akinsho/nvim-bufferline.lua'
-  -- use 'github/copilot.vim'
+  use 'github/copilot.vim'
   use 'lewis6991/gitsigns.nvim'
 
   use 'dinhhuy258/git.nvim' -- For git blame & browse
   -- For focusing on writing text files related (Zen)
   use 'folke/zen-mode.nvim'
-  -- Emacs orgmode for vim (adapted)
-  use { 'nvim-orgmode/orgmode', config = function()
-    require('orgmode').setup {}
-  end
-  }
   -- Icons
   use 'kyazdani42/nvim-web-devicons' -- File icons
   use 'numToStr/Comment.nvim'
diff --git a/plugin/lspconfig.lua b/plugin/lspconfig.lua
index 4ff78fb..042d640 100644
--- a/plugin/lspconfig.lua
+++ b/plugin/lspconfig.lua
@@ -1,5 +1,3 @@
--- https://github.com/neovim/nvim-lspconfig
-
 --vim.lsp.set_log_level("debug")
 
 local status, nvim_lsp = pcall(require, "lspconfig")
