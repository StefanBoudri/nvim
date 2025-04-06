return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim", 
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = { visible = true },
            },
            window = {
                position = "left",
                width = 30,
            },
        })

        vim.keymap.set('n', '<leader>n', ':Neotree toggle left<CR>', {})
    end
}
