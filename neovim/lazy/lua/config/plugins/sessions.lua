return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
		{ "<leader>wd", "<cmd>SessionDelete<CR>", desc = "Delete session" },
		--{ "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
	},
	config = function()
		require("auto-session").setup({
			enabled = true,

			session_lens = {
				load_on_setup = true, -- Initialize on startup (requires Telescope)
				theme_conf = { -- Pass through for Telescope theme options
					-- layout_config = { -- As one example, can change width/height of picker
					--   width = 0.8,    -- percent of window
					--   height = 0.5,
					-- },
				},
				previewer = false, -- File preview for session picker

				--mappings = {
				---- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
				--delete_session = { "i", "<C-D>" },
				--alternate_session = { "i", "<C-S>" },
				--copy_session = { "i", "<C-Y>" },
				--},

				session_control = {
					control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
					control_filename = "session_control.json", -- File name of the session control file
				},
			},
		})
	end,
}
