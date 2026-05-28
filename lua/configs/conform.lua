local options = {
    notify_on_error = true,

    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        c_cpp = { "clang_format" },
        c = { "clang_format" },
        cpp = { "clang_format" },
    },

    formatters = {
        clang_format = {
            append_args = {
                "-style={"
                    .. "UseTab: Never,"
                    .. "TabWidth: 4,"
                    .. "IndentWidth: 4,"
                    .. "AccessModifierOffset: -4,"
                    .. "IndentAccessModifiers: false,"
                    .. "PackConstructorInitializers: Never,"
                    .. "MaxEmptyLinesToKeep: 2," -- 最大空行
                    .. "}",
            },
        },
    },

    -- format_on_save = {
    --     -- These options will be passed to conform.format()
    --     timeout_ms = 500,
    --     lsp_fallback = true,
    -- },

    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}

return options
