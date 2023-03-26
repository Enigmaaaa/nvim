local global = require('core.global')
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- local packer = require 'packer'

-- -- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- -- Regenerate compiled loader file
-- :PackerCompile

-- -- Remove any disabled or unused plugins
-- :PackerClean

-- -- Clean, then install missing plugins
-- :PackerInstall

-- -- Clean, then update and install plugins
-- :PackerUpdate

-- -- Perform `PackerUpdate` and then `PackerCompile`
-- :PackerSync

-- -- Loads opt plugin immediately
-- :PackerLoad completion-nvim ale

return require('packer').startup(function(use)
    -- Plugins management
    use 'wbthomason/packer.nvim'

    -- edit
    use {
        'justinmk/vim-sneak',
        -- config = function ()
        --     api.nvim_set_keymap('n', 'f', '<Plug>Sneak_s', {noremap = true})
        --     api.nvim_set_keymap('n', 'F', '<Plug>Sneak_S', {noremap = true})
        --     api.nvim_set_keymap('n', 't', 'f', {noremap = true})
        --     api.nvim_set_keymap('n', 'T', 'F', {noremap = true})
        -- end
    }
    -- use 'tpope/vim-surround'
    use 'machakann/vim-sandwich'
    use { 'terryma/vim-expand-region',
        config = function()
            vim.g.expand_region_text_objects = {
                ['iw'] = 0,
                ['i"'] = 0,
                ["i'"] = 0,
                ['i]'] = 1,
                ['ib'] = 1,
                ['iB'] = 1,
                ['il'] = 0,
                ['ip'] = 0,
                ['ie'] = 0,
            }
        end
    }
    use { "ybian/smartim",
        event = { "InsertEnter" },
        config = function()
            -- default IME mode
            vim.g.smartim_default = "com.apple.keylayout.ABC"
        end,
        cond = global.is_mac
    }

    use { "Neur1n/neuims",
        cond = global.is_windows
    }
    -- map <CR> <Plug>(expand_region_expand)
    -- map <BS> <Plug>(expand_region_shrink)
    -- use 'gcmt/wildfire.vim'
    if packer_bootstrap then
        require('packer').sync()
    end
end)
-- [[

-- Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
-- " use vscode easymotion when in vscode mode
-- Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

-- " === Plug 'justinmk/vim-sneak' setting



-- Plug 'tpope/vim-surround'
-- Plug 'gcmt/wildfire.vim'

-- ]]
