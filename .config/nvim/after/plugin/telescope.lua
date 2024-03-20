-- ballz deep into projects
local builtin = require('telescope.builtin')
-- project files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- project grepfiles
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})

-- word beneth your cursor
vim.keymap.set('n', '<leader>fw', function() 
    local word = vim.fn.expand('<cword>')
    builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>fW', function() 
    local word = vim.fn.expand('<cWORD>')
    builtin.grep_string({ search = word })
end)
