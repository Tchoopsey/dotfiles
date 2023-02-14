-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local home = os.getenv('HOME')
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-noverify',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    --
    '-jar',  '~/.local/share/nvim/lsp_servers/jdtls/config_linux/org.eclipse.equinox.launcher',

    -- 💀
    '-configuration', '~/.local/share/nvim/lsp_servers/jdtls/config_linux',

    -- See `data directory configuration` section in the README
    '-data', vim.fn.expand('~/.cache/jdtls/workspace/') .. workspace_dir,
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
}
    --
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>lA", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
