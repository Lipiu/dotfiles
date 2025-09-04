return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "HiPhish/rainbow-delimiters.nvim",
    opts = { main = "ibl", opts = {}, event = "UIEnter" },

    config = function(opts)
        local highlight = {
            "GruvboxYellow",
            "GruvboxOrange",
            "GruvboxPurple",
            "GruvboxGreen",
            "GruvboxPink",
            "GruvboxAqua",
        }

        local gruvboxDelims = {
            "GruvboxYellow",
            "GruvboxOrange",
            "GruvboxPurple",
            "GruvboxGreen",
            "GruvboxPink",
        }

        local hooks = require("ibl.hooks")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "GruvboxYellow", { fg = "#fabd2f" })
            vim.api.nvim_set_hl(0, "GruvboxOrange", { fg = "#fe8019" })
            vim.api.nvim_set_hl(0, "GruvboxPurple", { fg = "#b16286" })
            vim.api.nvim_set_hl(0, "GruvboxGreen", { fg = "#8ec07c" })
            vim.api.nvim_set_hl(0, "GruvboxPink", { fg = "#d3869b" })
            vim.api.nvim_set_hl(0, "GruvboxAqua", { fg = "#83a598" })  -- Optional aqua color
        end)

        vim.g.rainbow_delimiters = { highlight = gruvboxDelims }
        require("ibl").setup({
            -- indent = { highlight = highlight },
            scope = { highlight = gruvboxDelims, show_start = false, show_end = false },
        })

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}

