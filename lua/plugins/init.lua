-- File is loaded by lazy package manager automatically
return {
    -- Color schemes
    {
        "folke/tokyonight.nvim",
        config = function ()
            vim.cmd([[colorscheme tokyonight-moon]])
        end,
        lazy = false,
        priority = 1000,
    },
    {
        "sainnhe/gruvbox-material",
        init = function ()
            vim.g.gruvbox_material_better_performance = 1
        end,
        lazy = true,
    },
    {
        "sainnhe/sonokai",
        init = function ()
            vim.g.sonokai_style = 'default'
            vim.g.sonokai_better_performance = 1
        end,
        lazy = true,
    },
    {
        "sainnhe/everforest",
        init = function ()
            vim.g.everforest_background = 'hard'
            vim.g.everforest_better_performance = 1
        end,
        lazy = true,
    },

    -- vim practice
    {
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
    },

    -- add-in motions
    'tpope/vim-repeat',
    {
        "ggandor/leap.nvim",
        config = function ()
            require("leap").set_default_keymaps()
        end,
    },
    {
        "kylechui/nvim-surround",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        config = true,
    },

    -- File browser
    {
        "preservim/nerdtree",
        keys = {
            { '<F3>', '<cmd>NERDTreeToggle<CR>', desc = "NERDTree" }
        }
    },

    -- Distraction-free writing
    {
        'junegunn/goyo.vim',
        cmd = "Goyo"
    },

    {
        'preservim/vim-markdown',
        dependencies = {'godlygeek/tabular'},
        ft = { "md", "markdown", "mdown" },
        init = function ()
            vim.g.vim_markdown_fenced_languages = {
                'python=py',
                'rust=rs',
                'bash=sh',
                'lua=lua',
            }
            vim.g.vim_markdown_frontmatter = 1
        end
    },

    --git
    'tpope/vim-fugitive',
    {
        'lewis6991/gitsigns.nvim',
        version = "release",
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            current_line_blame = false,
        },
    },

    -- Show spaces and indentation
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            vim.opt.list = true
            vim.opt.listchars:append("space:⋅")
            vim.opt.listchars:append("eol:↴")

            require("indent_blankline").setup {
                show_end_of_line = true,
                space_char_blankline = " ",
                use_treesitter = true,
            }
        end
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons'},
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
            }
        },
        config = true,
    },

    -- Telescope components
     {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    --Syntax highlighting, completion, etc.
    -- rust
    {
        'simrat39/rust-tools.nvim',
        ft = "rs"
    },
    'glepnir/lspsaga.nvim',

    -- Debugging
    {
        'mfussenegger/nvim-dap',
        event = "VeryLazy",
    },
    -- Snippets
    'L3MON4D3/LuaSnip',


    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        event = "VeryLazy",
        build = ':TSUpdate',
    },
}
