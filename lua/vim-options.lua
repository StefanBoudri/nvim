vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.tabstop = 4           -- Set tab width
vim.opt.shiftwidth = 4        -- Set indentation width
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Enable smart indentation
vim.g.mapleader = " "

vim.api.nvim_set_keymap('i', '<A-n>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-n>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('c', '<A-n>', '<Esc>', { noremap = true })

vim.opt.shell = 'powershell.exe'

vim.api.nvim_create_user_command("OpenInChrome", function()
    local file = vim.fn.expand('%:p')
    vim.fn.jobstart({ "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe", file }, { detach = true })
end, {})
