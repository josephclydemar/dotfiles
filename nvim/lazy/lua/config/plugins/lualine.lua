return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
                theme = "gruvbox_dark",
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"filename"},
                lualine_c = {"branch", "diff", "diagnostics"},
            },
		})
	end,
}
