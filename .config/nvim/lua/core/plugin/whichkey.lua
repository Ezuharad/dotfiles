-- Pane to show keymaps when keys are used
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Local Buffer Keymaps (which-key)",
		},
	},
}
