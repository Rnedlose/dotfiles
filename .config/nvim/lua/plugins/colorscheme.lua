-- lua/plugins/colorscheme.lua
return {
    -- Main colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            pcall(vim.cmd.colorscheme, "tokyonight-night")
        end,
    },
    --
    -- -- Optional colorschemes
    -- { "oskarnurm/koda.nvim", lazy = true },
    -- { "bluz71/vim-nightfly-colors", lazy = true },

    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         pcall(vim.cmd.colorscheme, "gruvbox")
    --     end
    -- }
}
