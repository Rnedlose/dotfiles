-- lua/config/keymaps.lua

-- Center screen when jumping/searching
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation
vim.keymap.set("n", "<C-]>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-[>", ":bprevious<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Buffer Delete" })

-- Window navigation
vim.keymap.set("n", "<BS>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vsplit" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Inc height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Dec height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Dec width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Inc width" })

-- Move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
