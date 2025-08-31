return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
	keys = {},
	config = function()
		require("auto-session").setup({
			enabled = false,
			session_lens = {
				load_on_setup = true, -- Initialize on startup (requires Telescope)
				theme_conf = {},
				previewer = false, -- File preview for session picker
				session_control = {
					control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
					control_filename = "session_control.json", -- File name of the session control file
				},
			},
		})

    vim.keymap.set("n", "<leader>wr", "<cmd>SessionSearch<CR>")

    vim.keymap.set("n", "<leader>ws", function ()
      local session_name = require("auto-session.lib").current_session_name()
      if session_name == "" then
        vim.ui.input({ prompt = "[SessionSave] Enter session name: " }, function (input)
          if input == "" then
            print("[SessionSave] cancelled.")
          else
            vim.cmd("SessionSave " .. input)
          end
        end)
      else
        vim.cmd("SessionSave " .. session_name)
      end
    end, { desc = "Save session" })

    vim.keymap.set("n", "<leader>wd", function ()
      local session_name = require("auto-session.lib").current_session_name()
      if session_name == "" then
        vim.ui.input({ prompt = "[SessionDelete] Enter session name: " }, function (input)
          vim.cmd("SessionDelete " .. input)
          print("Deleted Session: " .. input)
        end)
      else
        vim.cmd("SessionDelete " .. session_name)
        print("Deleted Session: " .. session_name)
      end
    end, { desc = "Delete session" })
	end,
}
