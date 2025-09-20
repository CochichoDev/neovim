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
<<<<<<< HEAD
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
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
=======
    --{"folke/noice.nvim",
    --    event = "VeryLazy",
    --    opts = {
    --      cmdline = {
    --            format = {
    --                search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
    --                search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    --            }
    --        }
    --    },
    --    dependencies = {
    --    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --    "MunifTanjim/nui.nvim",
    --    -- OPTIONAL:
    --    --   `nvim-notify` is only needed, if you want to use the notification view.
    --    --   If not available, we use `mini` as the fallback
    --    "rcarriga/nvim-notify",
    --    }
    --},
>>>>>>> a7b173f (Uncommited changed)
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
    --{
    --    'romgrk/barbar.nvim',
    --    name = "barbar",
    --    dependencies = {
    --      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    --      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --    },
    --    init = function() vim.g.barbar_auto_setup = false end,
    --    opts = {
    --      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    --      -- animation = true,
    --      -- insert_at_start = true,
    --      -- …etc.
    --    },
    --    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    --},
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
        "nvim-neo-tree/neo-tree.nvim",
        name = "neo-tree",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        --cmd = 'Neotree',
        --init = function()
        --  vim.api.nvim_create_autocmd('VimEnter', {
        --    -- make a group to be able to delete it later
        --    group = vim.api.nvim_create_augroup('NeoTreeInit', {clear = true}),
        --    callback = function()
        --      local f = vim.fn.expand('%:p')
        --        if vim.fn.isdirectory(f) == 0 then
        --            vim.cmd('Neotree action=show')
        --            vim.cmd('Neotree reveal_file=' .. f)
        --        else
        --            if #vim.api.nvim_list_bufs() == 1 and vim.bo[0].buftype == "" and vim.fn.bufname() == "" then
        --                vim.cmd("enew")         -- create a new empty buffer
        --                vim.cmd("bdelete!")     -- delete the initial empty buffer
        --            end
        --      end
        --    end
        --  })
        --  -- keymaps
        --end,
        --opts = {
        --  filesystem = {
        --    hijack_netrw_behavior = 'open_current'
        --  }
        --}
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

