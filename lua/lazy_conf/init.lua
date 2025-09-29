local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable',
			path,
		})
	end
end

function lazy.setup(plugins)
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
    {"catppuccin/nvim", name = "catppuccin", priority = 1000},
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {}
      end,
    },
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
          cmdline = {
                format = {
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                }
            }
        },
        dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        {"MunifTanjim/nui.nvim", commit="8d3bce9764e627b62b07424e0df77f680d47ffdb"},
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    },
    {'ARM9/arm-syntax-vim'},
	{'tpope/vim-fugitive'},
	{'lervag/vimtex'},
	{
        'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = true,
				theme = 'catppuccin',
				component_separators = '|',
				section_separators = '',
			},
		},
	},
    {'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"folke/which-key.nvim",
          event = "VeryLazy",
          init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
          end,
          opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl"
    },
    {"nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = { "c", "lua", "html", "make" },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
        end
    },
    {"mfussenegger/nvim-jdtls"},
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
          "SmiteshP/nvim-navic",
          "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
          -- configurations go here
        }
    },
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
        },
        -- Not all LSP servers add brackets when completing a function.
        -- To better deal with this, LazyVim adds a custom option to cmp,
        -- that you can configure. For example:
        --
        -- ```lua
        -- opts = {
        --   auto_brackets = { "python" }
        -- }
        -- ```
        main = "lazyvim.util.cmp",
    }
})

