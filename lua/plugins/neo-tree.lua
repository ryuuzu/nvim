return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                visible = true, -- Show hidden files automatically
                hide_gitignored = true, -- Keep ignoring node_modules, etc.
                always_show = { -- FORCE these to show, even if ignored
                    ".env",
                },
            },
        },
    },
}
