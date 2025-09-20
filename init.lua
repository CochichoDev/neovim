vim.opt.termguicolors = true

require("lazy_conf")

--require("neo-tree").setup({
--    window = {
--        position = "left",
--        width = 25,
--    },
--})

--require("barbar").setup({
--    sidebar_filetypes = {
--        ['neo-tree'] = {event = 'BufWipeout'},
--    },
--})

require("remaps")

vim.opt.clipboard:append('unnamedplus')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 10
vim.opt.foldenable = true

vim.opt.cursorline = true

vim.g.mapleader = " "

vim.diagnostic.config({
    float = {
        border = 'rounded',
    }
})

require("autocmds")
require("vimtex")
require("theme")
require("neo-tree")

vim.cmd.colorscheme 'catppuccin'

require("telescope_binds")

<<<<<<< HEAD
require("notify").setup({
  background_colour = "#000000",
})
vim.lsp.config('clangd', require('lspconfig.configs.clangd').default_config)
vim.lsp.config('pylsp', require('lspconfig.configs.pylsp').default_config)
vim.lsp.config('texlab', require('lspconfig.configs.texlab').default_config)
vim.lsp.config('glslls', require('lspconfig.configs.glslls').default_config)
vim.lsp.config('gopls', require('lspconfig.configs.gopls').default_config)
vim.lsp.config('cmake', require('lspconfig.configs.cmake').default_config)
vim.lsp.config('jdtls', require('lspconfig.configs.jdtls').default_config)
=======
--require("notify").setup({
--  background_colour = "#000000",
--})

local lspconfig = require'lspconfig'
lspconfig.clangd.setup{}
lspconfig.pylsp.setup{}
lspconfig.texlab.setup{}
lspconfig.glslls.setup {
    cmd = { 'glslls', '--stdin', '--target-env', 'opengl' },
}
lspconfig.cmake.setup{}
>>>>>>> a7b173f (Uncommited changed)

vim.api.nvim_create_autocmd('LspAttach',{
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	end,
})

local cmp = require'cmp'
cmp.setup {
	snippet = {
	},
	mapping = cmp.mapping.preset.insert {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
		  behavior = cmp.ConfirmBehavior.Replace,
		  select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_next_item()
		--  elseif luasnip.expand_or_locally_jumpable() then
		--	luasnip.expand_or_jump()
		  else
			fallback()
		  end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_prev_item()
		--  elseif luasnip.locally_jumpable(-1) then
		--	luasnip.jump(-1)
		  else
			fallback()
		  end
		end, { 'i', 's' }),
		},
		sources = {
		{ name = 'nvim_lsp' },
		--{ name = 'luasnip' },
	},
}

<<<<<<< HEAD

=======
>>>>>>> a7b173f (Uncommited changed)
require("ibl").setup()
