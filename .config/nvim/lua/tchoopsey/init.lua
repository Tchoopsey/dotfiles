require("tchoopsey.keymaps")
require("tchoopsey.options")

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
    end
})
