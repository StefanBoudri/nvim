return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "omnisharp", "clangd", "eslint", "jdtls", "jsonls", "markdown_oxide" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            local mason_registry = require("mason-registry")

            lspconfig.lua_ls.setup({
                cmd = {
                    mason_registry.get_package("lua-language-server"):get_install_path() ..
                    "/bin/lua-language-server.exe",
                },
                capabilities = capabilities,
            })
            lspconfig.omnisharp.setup({
                cmd = {
                    mason_registry.get_package("omnisharp"):get_install_path() .. "/omnisharp.cmd"
                },
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })
            lspconfig.markdown_oxide.setup({ capabilities = capabilities })

            -- Keymaps **only after LSP initialization**
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function()
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
                end,
            })
        end,
    },
}
