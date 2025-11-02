return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
		},
		{
			"mason-org/mason-lspconfig.nvim",
			lazy = false,
			opts = {
				ensure_installed = {
					"lua_ls",
					"grammarly",
					--- WEB
					"angularls",
					"astro",
					"cssls",
					"css_variables",
					"html",
					"jsonls",
					"marksman",
					"mdx_analyzer",
					"tailwindcss",
					"ts_ls",
					"basedpyright",
				},
				automatic_enable = true,
			},
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
			},
		},
		{
			"mfussenegger/nvim-lint",
			config = function()
				require("lint").linters_by_ft = {
					javascript = { "biome" },
					typescript = { "biome" },
					javascriptreact = { "biome" },
					typescriptreact = { "biome" },
					astro = { "biome" },
					python = { "ruff" },
				}
			end,
		},
		{
			"stevearc/conform.nvim",
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "biome" },
					typescript = { "biome" },
					javascriptreact = { "biome" },
					typescriptreact = { "biome" },
					json = { "biome" },
					html = { "biome" },
					css = { "biome" },
					scss = { "biome" },
					astro = { "biome" },
					python = { "ruff" },
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"stylua",
					"go-debug-adapter",
					"biome",
					"ruff",
				},
				auto_update = true,
				run_on_start = true,
				start_delay = 3000,
				integrations = {
					["mason-lspconfig"] = true,
					["mason-nvim-dap"] = true,
				},
			},
		},
		{
			"saghen/blink.cmp",
			version = "1.*",
			dependencies = {
				{
					"saghen/blink.compat",
					version = "2.*",
					lazy = true,
					opts = {},
				},
				"onsails/lspkind.nvim",
			},
			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts_extend = { "sources.default" },
			config = function()
				require("blink.cmp").setup({
					keymap = { preset = "enter" },
					appearance = {
						nerd_font_variant = "mono",
					},
					completion = {
						keyword = { range = "full" },
						trigger = { show_on_keyword = true },
						accept = { auto_brackets = { enabled = true } },
						list = { selection = { preselect = true, auto_insert = true } },
						menu = {
							draw = {
								columns = {
									{ "kind_icon" },
									{ "label", gap = 1 },
								},
								components = {
									label = {
										text = function(ctx)
											return require("colorful-menu").blink_components_text(ctx)
										end,
										highlight = function(ctx)
											return require("colorful-menu").blink_components_highlight(ctx)
										end,
									},
								},
							},
							auto_show = true,
							auto_show_delay_ms = 300,
						},
						documentation = { auto_show = true, auto_show_delay_ms = 300 },
						ghost_text = { enabled = true },
					},
					sources = {
						default = { "lsp", "buffer", "snippets", "path" },
						per_filetype = {
							lua = { inherit_defaults = true, "lazydev" },
						},
						providers = {
							lazydev = { module = "lazydev.integrations.blink" },
						},
					},
					snippets = { preset = "luasnip" },
					signature = { enabled = true },
					fuzzy = {
						implementation = "prefer_rust_with_warning",
						sorts = {
							"score",
							"sort_text",
							"kind",
						},
					},
				})
			end,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				"mfussenegger/nvim-dap",
				"williamboman/mason.nvim",
				"theHamsta/nvim-dap-virtual-text",
				{
					"rcarriga/nvim-dap-ui",
					dependencies = {
						"mfussenegger/nvim-dap",
						"nvim-neotest/nvim-nio",
						"folke/lazydev.nvim",
					},
					config = function()
						require("lazydev").setup({
							library = { "nvim-dap-ui" },
						})
					end,
				},
			},
			opts = {
				ensure_installed = {
					"cppdbg",
					"python",
					"php",
					"coreclr",
					"js",
					"bash",
					"javadbg",
					"javatest",
					"kotlin",
					"dart",
				},
				handler = {},
			},
		},
	},
	config = function()
		local cmp_capabilities = require("blink.cmp").get_lsp_capabilities({}, false)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_capabilities)
		vim.lsp.config("*", { capabilities = capabilities })
	end,
}
