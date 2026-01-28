-- lua/plugins/navigation.lua
return {
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer (toggle)" },
        },
        opts = {
            hijack_cursor = true,
            sync_root_with_cwd = true,
            respect_buf_cwd = true,

            update_focused_file = {
                enable = true,
                update_root = true,
            },

            view = {
                width = 32,
                side = "left",
                preserve_window_proportions = true,
            },

            renderer = {
                highlight_git = true,
                highlight_opened_files = "name",
                root_folder_label = false,
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },

            filters = {
                dotfiles = false,
            },

            git = {
                enable = true,
                ignore = false,
            },

            actions = {
                open_file = {
                    resize_window = true,
                },
            },
        },
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        keys = {
            {
                "<leader>a",
                function()
                    require("harpoon.mark").add_file()
                end,
                desc = "Harpoon add file",
            },
            {
                "<leader>h",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                desc = "Harpoon menu",
            },
            {
                "<leader>1",
                function()
                    require("harpoon.ui").nav_file(1)
                end,
                desc = "Harpoon file 1",
            },
            {
                "<leader>2",
                function()
                    require("harpoon.ui").nav_file(2)
                end,
                desc = "Harpoon file 2",
            },
            {
                "<leader>3",
                function()
                    require("harpoon.ui").nav_file(3)
                end,
                desc = "Harpoon file 3",
            },
            {
                "<leader>4",
                function()
                    require("harpoon.ui").nav_file(4)
                end,
                desc = "Harpoon file 4",
            },
        },
        config = function()
            require("harpoon").setup({})
        end,
    },

    -- Quickfix UI
    {
        "stevearc/quicker.nvim",
        keys = {
            {
                "<leader>qq",
                function()
                    require("quicker").toggle()
                end,
                desc = "Toggle quickfix (Quicker)",
            },
            {
                "<leader>ql",
                function()
                    require("quicker").toggle({ loclist = true })
                end,
                desc = "Toggle loclist (Quicker)",
            },
            { "]q", "<cmd>cnext<CR>", desc = "Next quickfix item" },
            { "[q", "<cmd>cprev<CR>", desc = "Prev quickfix item" },
            { "]l", "<cmd>lnext<CR>", desc = "Next loclist item" },
            { "[l", "<cmd>lprev<CR>", desc = "Prev loclist item" },
            {
                "<leader>qd",
                function()
                    vim.diagnostic.setqflist({ open = true })
                end,
                desc = "Diagnostics to quickfix",
            },
            {
                "<leader>qD",
                function()
                    vim.diagnostic.setloclist({ open = true })
                end,
                desc = "Diagnostics to loclist",
            },
            { "<leader>qc", "<cmd>cclose<CR>", desc = "Close quickfix" },
            { "<leader>qC", "<cmd>lclose<CR>", desc = "Close loclist" },
        },
        config = function()
            require("quicker").setup({})
        end,
    },
}
