local function setup_lsp_ui_and_keymaps()
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        focusable = false,
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        focusable = false,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local bufnr = args.buf
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
            map("n", "gr", vim.lsp.buf.references, "References")
            map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
            map("n", "gy", vim.lsp.buf.type_definition, "Goto Type Definition")
            map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")

            map("n", "K", vim.lsp.buf.hover, "Hover")
            map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")

            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
            map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")

            map("n", "gl", vim.diagnostic.open_float, "Line Diagnostics")
            map("n", "[d", function()
                vim.diagnostic.jump({ count = -1, float = true })
            end, "Prev Diagnostic")
            map("n", "]d", function()
                vim.diagnostic.jump({ count = 1, float = true })
            end, "Next Diagnostic")

            map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
            map("n", "<leader>lf", function()
                vim.lsp.buf.format({ async = true })
            end, "LSP Format")
        end,
    })
end

local function start_for_buf(bufnr, name, cmd, extra)
    if not cmd or #cmd == 0 or not cmd[1] then
        return
    end
    local cfg = { name = name, cmd = cmd }
    if extra then
        for k, v in pairs(extra) do
            cfg[k] = v
        end
    end
    vim.lsp.start(cfg, { bufnr = bufnr })
end

return {
    { "nvim-lua/plenary.nvim", lazy = true },

    -- You can keep this installed for Mason compatibility, but we do NOT call require("lspconfig")
    { "neovim/nvim-lspconfig", lazy = true },

    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup({})
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            setup_lsp_ui_and_keymaps()

            -- Capabilities from blink.cmp (if installed)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok_blink, blink = pcall(require, "blink.cmp")
            if ok_blink and blink.get_lsp_capabilities then
                capabilities = blink.get_lsp_capabilities(capabilities)
            end

            -- Register native LSP configs (Neovim 0.12+)
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim", "require" } },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.list_extend(vim.api.nvim_get_runtime_file("", true), {
                                vim.fn.stdpath("config"),
                                vim.fn.stdpath("data") .. "/lazy",
                            }),
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            vim.lsp.config("pyright", { capabilities = capabilities })
            vim.lsp.config("ruff_lsp", { capabilities = capabilities })
            vim.lsp.config("rust_analyzer", { capabilities = capabilities })
            vim.lsp.config("clangd", { capabilities = capabilities })
            vim.lsp.config("ts_ls", { capabilities = capabilities })
            vim.lsp.config("bashls", { capabilities = capabilities })

            -- Install servers with Mason (but don't try to auto-wire with setup_handlers)
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                    "clangd",
                    "ts_ls",
                    "bashls",
                },
                automatic_installation = true,
            })

            -- Start servers on filetype using plain command names (Linux PATH / Mason shims)
            -- Mason exposes binaries on PATH when launched from Neovim.
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local ft = vim.bo[args.buf].filetype

                    if ft == "lua" then
                        start_for_buf(args.buf, "lua_ls", { "lua-language-server" })
                    elseif ft == "python" then
                        start_for_buf(args.buf, "pyright", { "pyright-langserver", "--stdio" })
                        start_for_buf(args.buf, "ruff_lsp", { "ruff-lsp" })
                    elseif ft == "rust" then
                        start_for_buf(args.buf, "rust_analyzer", { "rust-analyzer" })
                    elseif ft == "c" or ft == "cpp" then
                        start_for_buf(args.buf, "clangd", { "clangd" })
                    elseif ft == "javascript" or ft == "typescript" then
                        start_for_buf(args.buf, "ts_ls", { "typescript-language-server", "--stdio" })
                    elseif ft == "sh" or ft == "bash" or ft == "zsh" then
                        start_for_buf(args.buf, "bashls", { "bash-language-server", "start" })
                    end
                end,
            })

            -- Attach to already-open buffers
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_is_loaded(bufnr) then
                    local ft = vim.bo[bufnr].filetype
                    if ft ~= "" then
                        vim.api.nvim_exec_autocmds("FileType", { buffer = bufnr })
                    end
                end
            end
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LSP servers
                    "lua-language-server",
                    "pyright",
                    "ruff-lsp",
                    "rust-analyzer",
                    "clangd",
                    "typescript-language-server",
                    "bash-language-server",

                    -- Formatters
                    "stylua",
                    "black",
                    "prettier",
                    "rustfmt",
                },
                run_on_start = true,
            })
        end,
    },
}
