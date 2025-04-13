return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local fgrep = require("config.telescope.fgrep")
            require("telescope").setup({
                defaults = {
                    path_display = { "shorten" },
                },
                extensions = {
                    fzf = {},
                },
                pickers = {
                    find_files = {
                        theme = "ivy",
                    },
                    live_grep = {
                        theme = "ivy",
                    },
                    buffers = {
                        theme = "ivy",
                    },
                    current_buffer_fuzzy_find = {
                        theme = "ivy",
                    },
                    git_commits = {
                        theme = "ivy",
                    },
                    oldfiles = {
                        theme = "ivy",
                    },
                    lsp_references = {
                        theme = "ivy",
                    },
                    lsp_definitions = {
                        theme = "ivy",
                    },
                    diagnostics = {
                        theme = "ivy",
                    },
                },
            })
            require("telescope").load_extension("fzf")
            --require("telescope").load_extension("split_ff")
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", fgrep.live_fgrep, {})
            vim.keymap.set("n", "<leader>gg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>vv", builtin.current_buffer_fuzzy_find, {})
            vim.keymap.set("n", "<leader>cc", builtin.git_commits, {})
            vim.keymap.set("n", "<leader>oo", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>rf", builtin.lsp_references, {})
            vim.keymap.set("n", "<leader>df", builtin.lsp_definitions, {})
            vim.keymap.set("n", "<leader>dd", builtin.diagnostics, {})
            vim.keymap.set("n", "<M-z>", function()
                builtin.find_files({
                    cwd = vim.fn.stdpath("config"),
                })
            end, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- This is your opts table
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    },
                },
            })
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
}
