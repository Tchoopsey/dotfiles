return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        indent = { highlight = "Whitespace", },
        whitespace = {
            highlight = "Whitespace",
            remove_blankline_trail = false,
        },
        scope = { enabled = false }
    },
}
