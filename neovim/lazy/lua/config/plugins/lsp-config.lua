return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    -- "ast_grep",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Set up lspconfig.
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            -- lspconfig.ast_grep.setup({
            --     cmd = { 'ast-grep', 'lsp' },
            --     filetypes = { "c", "cpp" },
            -- })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            -- vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})
            -- vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

        end
    },
}

