return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>a", mark.add_file)
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

			vim.keymap.set("n", "<A-a>", function()
				ui.nav_file(1)
			end)
			vim.keymap.set("n", "<A-s>", function()
				ui.nav_file(2)
			end)
			vim.keymap.set("n", "<A-d>", function()
				ui.nav_file(3)
			end)
			vim.keymap.set("n", "<A-f>", function()
				ui.nav_file(4)
			end)
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			local nvimtree = require("nvim-tree")

			nvimtree.setup({
				renderer = { group_empty = true },
				view = {
					adaptive_size = true,
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local status, telescope = pcall(require, "telescope")
			if not status then
				return
			end
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					mappings = {
						n = {
							["q"] = actions.close,
						},
					},
					layout_config = {
						width = 200,
						height = 200,
						preview_width = 100,
					},
				},
			})

			local set = vim.keymap.set

			set("n", "<leader>gs", ":Telescope git_status<cr>")
			set("n", "<leader>gc", ":Telescope git_commits<cr>")
			set("n", "<leader>gb", ":Telescope git_branches<cr>")
			set("n", "<leader>km", ":Telescope keymaps<cr>")

			set("n", ";f", function()
				builtin.find_files({
					hidden = false,
				})
			end)
			set("n", "<C-p>", function()
				builtin.git_files({
					no_ignore = false,
					hidden = false,
				})
			end)
			set("n", ";r", function()
				builtin.live_grep()
			end)
			set("n", "\\\\", function()
				builtin.buffers()
			end)
			set("n", ";t", function()
				builtin.help_tags()
			end)
			set("n", ";;", function()
				builtin.resume()
			end)
			set("n", ";e", function()
				builtin.diagnostics()
			end)
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local status, gitsigns = pcall(require, "gitsigns")
			if not status then
				return
			end

			gitsigns.setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = {
			toggler = {
				line = "gcc",
				block = "gbc",
			},
		},
	},
	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		event = "VeryLazy",
		config = function()
			-- Load treesitter grammar for org
			require("orgmode").setup_ts_grammar()

			-- Setup treesitter
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "org" },
				},
				ensure_installed = { "org" },
			})

			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},
}
