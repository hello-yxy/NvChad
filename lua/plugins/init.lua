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
                "json",
                "python",
                "cmake",
                "javascript",
                "typescript",
            }
            treesitter.setup()
            treesitter.install(languages)
        end,
    },

    { import = "nvchad.blink.lazyspec" },
}
