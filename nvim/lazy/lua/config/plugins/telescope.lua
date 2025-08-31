-- prompt_title = "Current Buffer Live Grep",
-- search_dirs = { vim.fn.expand("%:p") },

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").load_extension("fzf")
			require("telescope").setup({
				defaults = {
					-- path_display = { "shorten" },
					borderchars = {
						prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					},
				},
				extensions = {
					fzf = {},
				},
			})

			local fgrep = require("config.telescope.fgrep")
			local builtin = require("telescope.builtin")
			-- local actions = require("telescope.actions")
			-- local action_state = require("telescope.actions.state")

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Find Files" })

			vim.keymap.set("n", "<leader>tt", function()
				builtin.find_files({
					prompt_title = "No Ignore Find Files",
					hidden = true,
					no_ignore = true,
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "No Ignore Find Files" })

			-- vim.keymap.set("n", "<leader>tt", function()
			-- 	builtin.find_files({
			--        prompt_title = "New Tab Find Files",
			--        hidden = true,
			-- 		attach_mappings = function(_, map)
			-- 			map("i", "<CR>", function(prompt_bufnr)
			-- 				local entry = action_state.get_selected_entry()
			-- 				local filepath = entry and entry.path or entry.filename
			--            actions.close(prompt_bufnr)
			--            vim.cmd("tabnew " .. filepath)
			-- 			end)
			-- 			return true
			-- 		end,
			-- 	})
			-- end, { desc = "New Tab Find Files" })

			vim.keymap.set("n", "<leader>yy", function()
				fgrep.live_fgrep({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Live File Grep" })

			vim.keymap.set("n", "<leader>gg", function()
				builtin.live_grep({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
					additional_args = function()
						return { "--pcre2" }
					end,
				})
			end, { desc = "Live Grep" })

			vim.keymap.set("n", "<leader>hh", function()
				builtin.grep_string({
					prompt_title = "Grep String",
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Grep String" })

			vim.keymap.set("n", "<leader>ll", function()
				builtin.quickfix({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Quickfix" })

			vim.keymap.set("n", "<leader>vv", function()
				builtin.current_buffer_fuzzy_find({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Current Buffer Fuzzy Find" })

			vim.keymap.set("n", "<leader>bb", function()
				builtin.buffers({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Buffers" })

			vim.keymap.set("n", "<leader>vc", function()
				builtin.git_commits({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Git Commits" })

			vim.keymap.set("n", "<leader>vs", function()
				builtin.git_status({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Git Status" })

			vim.keymap.set("n", "<leader>vb", function()
				builtin.git_branches({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Git Branches" })

			vim.keymap.set("n", "<leader>oo", function()
				builtin.oldfiles({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Old Files" })

			vim.keymap.set("n", "<leader>rf", function()
				builtin.lsp_references({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "LSP References" })

			vim.keymap.set("n", "<leader>df", function()
				builtin.lsp_definitions({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "LSP Definitions" })

			vim.keymap.set("n", "<leader>dd", function()
				builtin.diagnostics({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Diagnostics" })

			vim.keymap.set("n", "<leader>mm", function()
				builtin.marks({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Marks" })

			vim.keymap.set("n", "<leader>jj", function()
				builtin.jumplist({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Jumplist" })

			vim.keymap.set("n", "<leader>kk", function()
				builtin.keymaps({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Keymaps" })

			vim.keymap.set("n", "<leader>cc", function()
				builtin.commands({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Commands" })

			vim.keymap.set("n", "<M-z>", function()
				builtin.find_files({
					prompt_title = "NVIM Config Find Files",
					cwd = vim.fn.stdpath("config"),

					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
