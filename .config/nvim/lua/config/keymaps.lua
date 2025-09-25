local augroup = vim.api.nvim_create_augroup
local TchoopseyGroup = augroup('Tchoopsey', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = TchoopseyGroup,
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>jd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>jr", function() vim.lsp.buf.reference() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>sls", function() vim.cmd("LspStart") end, opts)
        vim.keymap.set("n", "<leader>ils", function() vim.cmd("LspInfo") end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

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
keymap("n", "<S-h>", ":bprevious<CR>", opts)


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
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts) -- Find project files
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", opts)      -- Grep from file

-- Buffers
keymap("n", "<leader>bd", ":bdelete<CR>", opts)
keymap("n", "<leader>bf", ":buffers<CR>", opts)
-- New tab
keymap("n", "<leader>nt", ":tabnew %<CR>", opts)
-- gt for changing tabs

