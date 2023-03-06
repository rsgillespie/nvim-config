-- lsp configs and key mappings
return {
    'neovim/nvim-lspconfig',
    -- event = "VeryLazy",
    config = function()
        -- lsp keymaps activated at load
        local opts = { silent = true }
        vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        vim.keymap.set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

        -- lsp_config keymappings activated when lsp is attached to current buffer
        local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            local nbufkm = function(lhs, rhs)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, { noremap = true, silent = true })
            end
            nbufkm('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
            nbufkm('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
            nbufkm('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
            nbufkm('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
            nbufkm('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
            nbufkm('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
            nbufkm('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
            nbufkm('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
            nbufkm('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
            nbufkm('<leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>')
            nbufkm('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
            nbufkm('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
            nbufkm('<leader>cf', '<cmd>lua vim.lsp.buf.format {async = true} ()<CR>')
        end

        local lspconfig = require 'lspconfig'
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local servers = { 'pylsp', 'rust_analyzer', 'tsserver' }
        for _, lsp in pairs(servers) do
            local lspOpts = {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            if lsp == "rust_analyzer" then
                local rt_loaded, rust_tools = pcall(require, "rust-tools")
                if not rt_loaded then
                    print("Failed to load rust_tools")
                else
                    rust_tools.setup {
                        tools = {
                            hover_actions = {
                                auto_focus = true,
                            }
                        },
                        server = lspOpts,
                    }
                    goto continue
                end
            end
            lspconfig[lsp].setup(lspOpts)
            ::continue::
        end

        local runtime_path = vim.split(package.path, ';')
        -- Make runtime files discoverable to server
        table.insert(runtime_path, 'lua/?.lua')
        table.insert(runtime_path, 'lua/?/init.lua')

        lspconfig.lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = runtime_path
                    },
                    diagnostics = {
                        globals = 'vim'
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true)
                    },
                    telemetry = {
                        enable = false
                    }
                }
            }
        }
    end
}
