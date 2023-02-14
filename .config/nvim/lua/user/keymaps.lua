local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten func name
local keymap = vim.api.nvim_set_keymap

-- Leader space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Normal mode
-- Win nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Toggle File Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Toggle Terminal
keymap("n", "<leader>tt", ":ToggleTerm<cr>", opts)

-- Buff nav
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bnext<CR>", opts)


-- Insert

-- Visual
-- Indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)

-- Split screen
keymap("n", "<leader>vs" , ":vsplit <CR>", opts)    --vertical
keymap("n", "<leader>hs" , ":split <CR>", opts)     --horisontal

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts) -- Find project files
keymap("n", "<c-t>", "<cmd>Telescope live_grep<CR>", opts)      -- Grep from file

-- Buffer delete
keymap("n", "<leader>bd", ":Bdelete<CR>", opts)
keymap("n", "<leader>bbd", ":Bdelete!<CR>", opts)
-- New tab
keymap("n", "<leader>nt", ":tabnew %<CR>", opts)
-- gt for changing tabs
