return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require "nvim-treesitter"
            local languages = {
                "c",
                "cpp",
                "python",
                "cmake",
            }
            treesitter.setup()
            treesitter.install(languages)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = languages,
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },
}
