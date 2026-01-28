-- lua/plugins/ui.lua
return {
    -- Icons
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
        "echasnovski/mini.icons",
        lazy = true,
        config = function()
            require("mini.icons").setup()
        end,
    },

    -- Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>?",
                function()
                    local wk = require("which-key")
                    wk.show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
        opts = {
            preset = "modern",
            win = { border = "rounded" },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)

            wk.add({
                { "<leader>s", group = "Splits" },
                { "<leader>f", group = "Find" },
                { "<leader>e", group = "Explorer" },
                { "<leader>q", group = "Quickfix" },
                { "<leader>o", group = "Opencode" },
                { "<leader>l", group = "LSP" },
                { "<leader>g", group = "LSP Navigation" },
                { "<leader>c", group = "Code" },
                { "<leader>d", group = "Diagnostics" },
            })
        end,
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            sidebar_filetypes = {
                ['neo-tree'] = { event = 'BufWipeout' }
            },
        },
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "echasnovski/mini.icons" },
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    always_last_status = true,
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "filetype", "progress" },
                    lualine_y = { "location" },
                    lualine_z = { "hostname" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                winbar = {
                    lualine_c = {
                        {
                            function()
                                local path = vim.fn.expand("%:p:h:t")
                                if path == "" then
                                    return ""
                                end
                                local icon = require("mini.icons").get("folder", { default = "", animate = true })
                                return icon .. " " .. path
                            end,
                            cond = function()
                                return require("lualine.utils.mode").get_mode() ~= "t"
                            end,
                        },
                    },
                },
            })
        end,
    },
}
