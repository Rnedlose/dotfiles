-- lua/plugins/formatting.lua
return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
                end,
                mode = { "n", "v" },
                desc = "Format (Conform)",
            },
        },
        config = function()
            local mason_root = "C:\\nvim-mason"
            local mason_bin = vim.fs.joinpath(mason_root, "bin")
            local mason_packages = vim.fs.joinpath(mason_root, "packages")

            require("conform").setup({
                format_on_save = { timeout_ms = 500, lsp_fallback = true },
                formatters = {
                    stylua = { command = vim.fs.joinpath(mason_packages, "stylua", "stylua.exe") },
                    black = { command = vim.fs.joinpath(mason_packages, "black", "venv", "Scripts", "black.exe") },
                    rustfmt = { command = vim.fs.joinpath(mason_bin, "rustfmt.CMD") },
                    prettier = { command = vim.fs.joinpath(mason_bin, "prettier.cmd") },
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    rust = { "rustfmt" },
                    markdown = { "prettier" },
                },
            })
        end,
    },
}
