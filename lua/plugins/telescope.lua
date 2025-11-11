return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-fzy-native.nvim",
		"sharkdp/fd",
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			event = "VimEnter",
			branch = "main",
			build = ":TSUpdate",
			opts = {
				ensure_installed = {
					"lua",
					"ini",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"json",
					"astro",
					"scss",
					"yuck",
				},
				highlight = { enable = true },
				indent = { enable = true },
			},
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
				},
			},
			extensions = {
				fzy_native = {
					fuzzy = true,
					override_generic_sorter = true,
					overrride_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		telescope.load_extension("fzy_native")
	end,
}
