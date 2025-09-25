return {
    "ThePrimeagen/harpoon",

    config = function ()

        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- add file to harpoon
        vim.keymap.set("n", "<leader>ad", mark.add_file)
        -- harpoon menu
        vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)

        -- navigation
        vim.keymap.set("n", "<leader>1", function () ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>2", function () ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>3", function () ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>4", function () ui.nav_file(4) end)

    end,
    dependencies = {'nvim-lua/plenary.nvim' }
}
