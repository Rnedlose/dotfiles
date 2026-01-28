-- lua/plugins/opencode.lua
return {
	{
		"NickvanDyke/opencode.nvim",
		event = "VeryLazy",
		dependencies = { "folke/snacks.nvim" },
		keys = {
			{
				"<leader>oa",
				function()
					require("opencode").ask("@this: ", { submit = true })
				end,
				mode = { "n", "x" },
				desc = "OpenCode: Ask (@this)",
			},
			{
				"<leader>oo",
				function()
					require("opencode").select()
				end,
				mode = { "n", "x" },
				desc = "OpenCode: Actions",
			},
			{
				"<leader>ot",
				function()
					require("opencode").toggle()
				end,
				mode = { "n", "t" },
				desc = "OpenCode: Toggle UI",
			},
			{
				"go",
				function()
					return require("opencode").operator("@this ")
				end,
				mode = { "n", "x" },
				desc = "OpenCode: Add range",
				expr = true,
			},
			{
				"goo",
				function()
					return require("opencode").operator("@this ") .. "_"
				end,
				mode = "n",
				desc = "OpenCode: Add line",
				expr = true,
			},
			{
				"<S-C-u>",
				function()
					require("opencode").command("session.half.page.up")
				end,
				mode = "n",
				desc = "OpenCode: Scroll up",
			},
			{
				"<S-C-d>",
				function()
					require("opencode").command("session.half.page.down")
				end,
				mode = "n",
				desc = "OpenCode: Scroll down",
			},
		},
		config = function()
			-- allow file change detection / reload
			vim.o.autoread = true

			vim.g.opencode_opts = {
				provider = { enabled = "snacks" },
			}
		end,
	},
}
