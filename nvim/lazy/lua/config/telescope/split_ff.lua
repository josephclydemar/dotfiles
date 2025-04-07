local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
--local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values
--local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

M.vsplit_ff = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()

	local finder = finders.new_oneshot_job({ "fdfind", "--type", "f", "--hidden", "--follow" }, opts)

	-- Define the picker
	pickers
		.new(opts, {
			prompt_title = "VSplit Find Files", -- Title for the picker
			finder = finder,
			previewer = conf.file_previewer(opts), -- Default file previewer
			sorter = require("telescope.sorters").get_fuzzy_file(), -- Fuzzy file sorter
			attach_mappings = function(prompt_bufnr, map)
				map("i", "<Enter>", function()
					local selection = action_state.get_selected_entry()

					if not selection then
						return
					end

					vim.cmd("vsplit " .. selection.value)
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

					-- Close the Telescope picker
					-- actions.close(prompt_bufnr)
				end)
				return true -- Return true to indicate the mapping is valid
			end,
		})
		:find()
end

return M
