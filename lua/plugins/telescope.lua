-- Fuzzy find
return
{
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function ()
        -- key mappings
        vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
        vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
        vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
        vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
        vim.keymap.set('n', '<leader>ft', '<cmd>Telescope treesitter<cr>')
        require('telescope').load_extension('fzf')
    end
}
