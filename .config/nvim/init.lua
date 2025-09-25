require("config.options")
require("config.keymaps")
require("config.lazy")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd "hi Normal ctermbg=none guibg=none"
