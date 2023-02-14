local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
    -- packer plugin
    use "wbthomason/packer.nvim" 
    -- Lua utils for nvim
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    
    -- UI tweaks
    use {"ellisonleao/gruvbox.nvim"}
    use { "iamcco/markdown-preview.nvim", run = "cd app & yarn install", cmd = "MarkdownPreview" } 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }   

    -- Code Completion
    use "hrsh7th/nvim-cmp"  -- completion
    use "hrsh7th/cmp-buffer" -- buffer cmps
    use "hrsh7th/cmp-path"  -- path cmps
    use "hrsh7th/cmp-cmdline" -- cli cmps
    use "saadparwaiz1/cmp_luasnip" -- snippet cmps
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    
    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    
    -- LSP
    use "neovim/nvim-lspconfig"     -- enable LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "williamboman/nvim-lsp-installer" -- language server installer
    use "RRethy/vim-illuminate"
    -- Formater
    use "jose-elias-alvarez/null-ls.nvim"
    -- Java LSP cfg
    use "mfussenegger/nvim-jdtls"
    
    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
       run = ":TSUpdate" }
    
    -- Autoclose brackets
    use "windwp/nvim-autopairs"
    
    -- Easy commenting
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Nvim-Tree
    use "kyazdani42/nvim-tree.lua"
        
    -- Buffy Bufferlines
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    -- Indent blank_line
    use "lukas-reineke/indent-blankline.nvim"
    
    use "akinsho/toggleterm.nvim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
