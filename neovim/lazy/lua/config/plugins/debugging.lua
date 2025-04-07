return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "interpreter=dap", "eval-command", "set print pretty on" }
            }

            dap.configurations.c = {
                {
                    name = "Debug with GDB",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}", -- Use current working directory as the default
                    stopAtEntry = true,  -- Stop at the entry point of the program
                    args = {}, -- You can specify program arguments here if necessary
                    externalTerminal = false,
                },
            }

            vim.keymap.set("n", "<leader>st", dap.continue, {})
            vim.keymap.set("n", "<leader>nl", dap.step_over, {})
            vim.keymap.set("n", "<leader>si", dap.step_into, {})
            vim.keymap.set("n", "<leader>so", dap.step_out, {})
            vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<leader>sb", dap.set_breakpoint, {})
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}

