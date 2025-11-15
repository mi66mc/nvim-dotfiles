return {
    "neovim/nvim-lspconfig",

    config = function()
        local lsp = require("lspconfig")

        vim.lsp.config["rust_analyzer"] = {
            name = "rust_analyzer",
            cmd = { "rust-analyzer" },
            filetypes = { "rust" },
            root_dir = vim.fs.root(0, { "Cargo.toml", ".git" }),
            settings = {
                ["rust-analyzer"] = {
                    inlayHints = {
                        lifetimeElisionHints = {
                            enable = true,
                            useParameterNames = true,
                        },
                        bindingModeHints = { enable = true },
                        closureReturnTypeHints = { enable = true },
                        expressionAdjustmentHints = { enable = true },
                        closureCaptureHints = { enable = true },
                    },
                },
            },
        }

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                end
            end,
        })
    end
}
