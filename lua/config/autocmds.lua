-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Auto-detect htmldjango for HTML files in a Django project
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.html",
    callback = function()
        -- Check if we are in a django project (look for manage.py)
        if vim.fn.filereadable("manage.py") == 1 then
            vim.bo.filetype = "htmldjango"
        end
    end,
})
