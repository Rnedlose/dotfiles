-- lua/plugins/snacks.lua
return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 900,
        keys = {
            {
                "<leader>ff",
                function()
                    require("snacks").picker.files({ cwd = vim.fn.getcwd() })
                end,
                desc = "Find files (cwd)",
            },
            {
                "<leader>fg",
                function()
                    require("snacks").picker.grep({ cwd = vim.fn.getcwd() })
                end,
                desc = "Grep (cwd)",
            },
            {
                "<leader>fG",
                function()
                    require("snacks").picker.grep({ cwd = vim.fn.getcwd(), hidden = true })
                end,
                desc = "Grep hidden (cwd)",
            },
            {
                "<leader>fb",
                function()
                    require("snacks").picker.buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>fr",
                function()
                    require("snacks").picker.resume()
                end,
                desc = "Resume picker",
            },
            {
                "<leader>fw",
                function()
                    require("snacks").picker.grep({ cwd = vim.fn.getcwd(), search = vim.fn.expand("<cword>") })
                end,
                desc = "Grep word",
            },
            {
                "<leader>fW",
                function()
                    require("snacks").picker.grep({ cwd = vim.fn.getcwd(), search = vim.fn.expand("<cWORD>") })
                end,
                desc = "Grep WORD",
            },
            {
                "<leader>fd",
                function()
                    require("snacks").dashboard()
                end,
                desc = "Dashboard",
            },
        },

        config = function()
            local snacks = require("snacks")

            snacks.setup({
                picker = { enabled = true, layout = { preset = "ivy" } },
                input = { enabled = true },
                terminal = { enabled = true },

                dashboard = {
                    enabled = true,
                    startup = true,

                    preset = {
                        keys = {
                            {
                                icon = " ",
                                key = "f",
                                desc = "Find files",
                                action = function()
                                    snacks.dashboard.pick("files", { cwd = vim.fn.getcwd() })
                                end,
                            },
                            {
                                icon = "󰱼 ",
                                key = "g",
                                desc = "Grep",
                                action = function()
                                    snacks.dashboard.pick("grep", { cwd = vim.fn.getcwd() })
                                end,
                            },
                            {
                                icon = " ",
                                key = "r",
                                desc = "Recent files",
                                action = function()
                                    snacks.dashboard.pick("recent")
                                end,
                            },
                            { icon = " ", key = "n", desc = "New file", action = ":enew" },
                            {
                                icon = " ",
                                key = "c",
                                desc = "Config",
                                action = function()
                                    snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
                                end,
                            },
                            { icon = "󰒲 ", key = "p", desc = "Plugins (lazy)", action = ":Lazy" },
                            { icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
                        },
                    },

                    sections = {
                        { section = "header" },
                        { section = "keys",   gap = 1, padding = 1 },
                        { section = "startup" },
                    },
                },
            })

            -- Make Snacks pickers easy to exit / refocus editor
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "snacks_picker",
                callback = function(args)
                    local bufnr = args.buf
                    local opts = { buffer = bufnr, silent = true, nowait = true }

                    vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", opts)
                    vim.keymap.set("n", "q", "<cmd>close<CR>", opts)

                    vim.keymap.set("n", "<C-w>p", "<cmd>wincmd p<CR>", opts)
                    vim.keymap.set("n", "<C-w><C-w>", "<cmd>wincmd p<CR>", opts)

                    vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
                    vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
                    vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
                    vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", opts)
                end,
            })

            -- If snacks uses a terminal buffer, make it escapable too
            vim.api.nvim_create_autocmd("TermOpen", {
                callback = function(args)
                    local opts = { buffer = args.buf, silent = true, nowait = true }

                    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
                    vim.keymap.set("n", "q", "<cmd>close<CR>", opts)
                    vim.keymap.set("n", "<C-w>p", "<cmd>wincmd p<CR>", opts)
                end,
            })
        end,
    },
}
