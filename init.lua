vim.opt.termguicolors = true

require("lazy_conf")

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

require("autocmds")
require("vimtex")
require("theme")

vim.cmd.colorscheme 'catppuccin'

require("telescope_binds")

require("notify").setup({
  background_colour = "#000000",
})

local lspconfig = require'lspconfig'
lspconfig.clangd.setup{}
lspconfig.pylsp.setup{}
lspconfig.texlab.setup{}

vim.api.nvim_create_autocmd('LspAttach',{
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	end,
})

local cmp = require'cmp'
local luasnip = require'luasnip'
cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
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
		  elseif luasnip.expand_or_locally_jumpable() then
			luasnip.expand_or_jump()
		  else
			fallback()
		  end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_prev_item()
		  elseif luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		  else
			fallback()
		  end
		end, { 'i', 's' }),
		},
		sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}

require'indent_blankline'.setup {
    show_current_context = true,
    show_current_context_start = true,
}
