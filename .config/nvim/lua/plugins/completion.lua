-- lua/plugins/completion.lua
return {
	{
		"Saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("blink.cmp").setup({
				fuzzy = { implementation = "lua" },
				signature = { enabled = true },
				keymap = {
					["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
					["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
					["<CR>"] = { "accept", "fallback" },
					["<C-e>"] = { "cancel", "fallback" },
				},
				completion = {
					list = {
						selection = {
							preselect = false,
							auto_insert = false,
						},
					},
					documentation = { auto_show = true, auto_show_delay_ms = 500 },
					menu = {
						auto_show = true,
						draw = {
							treesitter = { "lsp" },
							columns = {
								{ "kind_icon", "label", "label_description", gap = 1 },
								{ "kind" },
							},
						},
					},
				},
			})

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
