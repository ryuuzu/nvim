return {
    -- 1. Django Utilities (Commands, Goto Template, etc.)
    {
        "mizisu/django.nvim",
        dependencies = {
            { "folke/snacks.nvim" },
            {
                "saghen/blink.cmp",
                optional = true,
                opts = {
                    sources = {
                        default = { "django" },
                        providers = {
                            django = {
                                name = "Django",
                                module = "django.completions.blink",
                                async = true,
                            },
                        },
                    },
                },
            },
        },
        config = function()
            require("django").setup()
        end,
    },
    -- 2. Filetype Detection for Django Templates
    -- Ensure .html files in your django project are recognized as 'htmldjango'
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "htmldjango" })
            end
        end,
    },

    -- 3. Configure HTML Django Formatting & Linting (using djlint)
    {
        "stevearc/conform.nvim",
        opts = function(_, opts)
            opts.formatters_by_ft = opts.formatters_by_ft or {}
            -- Use djlint for htmldjango files
            opts.formatters_by_ft.htmldjango = { "djlint" }
            -- Optional: Use djlint for standard html files too if you prefer
            opts.formatters_by_ft.html = { "djlint" }
        end,
    },

    -- 4. Add Linter for Django Templates
    {
        "mfussenegger/nvim-lint",
        opts = function(_, opts)
            opts.linters_by_ft = opts.linters_by_ft or {}
            opts.linters_by_ft.htmldjango = { "djlint" }
        end,
    },
}
