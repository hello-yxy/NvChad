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

    {
        "mfussenegger/nvim-dap",
        lazy = true,
        -- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
        -- modified.
        keys = {
            {
                "<leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Toggle Breakpoint",
            },

            {
                "<leader>dc",
                function()
                    require("dap").continue()
                end,
                desc = "Continue",
            },

            {
                "<leader>dC",
                function()
                    require("dap").run_to_cursor()
                end,
                desc = "Run to Cursor",
            },

            {
                "<leader>dT",
                function()
                    require("dap").terminate()
                end,
                desc = "Terminate",
            },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        ---@type MasonNvimDapSettings
        opts = {
            -- This line is essential to making automatic installation work
            -- :exploding-brain
            handlers = {},
            automatic_installation = {
                -- These will be configured by separate plugins.
                exclude = {
                    "delve",
                    "python",
                },
            },
            -- DAP servers: Mason will be invoked to install these if necessary.
            ensure_installed = {
                "bash",
                "codelldb",
                "php",
                "python",
            },
        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },

        config = function()
            local dap = require "dap"
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("path to executable", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "$workspaceFolder",
                    stopAtEntry = true,
                },
            }
        end,
    },
    {
        "sphamba/smear-cursor.nvim",
        lazy = false,
        opts = {
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = true,

            -- Smear cursor when moving within line or to neighbor lines.
            -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
            smear_between_neighbor_lines = true,

            -- Draw the smear in buffer space instead of screen space when scrolling
            scroll_buffer_space = true,

            -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
            -- Smears and particles will look a lot less blocky.
            legacy_computing_symbols_support = false,

            -- Smear cursor in insert mode.
            -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
            smear_insert_mode = true,
        },
    },
}
