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
            sources = {
                "filesystem",
                "buffers",
                "git_status",
            },
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,

            filesystem = {
                hijack_netrw_behavior = "open_default",
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },

            window = {
                width = 32,
                mappings = {
                    ["<cr>"] = "open",
                    ["l"] = "open",
                    ["s"] = "open_split",
                    ["v"] = "open_vsplit",
                },
            },

            default_component_configs = {
                indent = { padding = 0, indent_size = 2 },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "󰜌",
                },
                git_status = {
                    symbols = {
                        added = "",
                        modified = "",
                        deleted = "",
                        renamed = "",
                        untracked = "",
                        ignored = "",
                        unstaged = "✗",
                        staged = "✓",
                        conflict = "",
                    },
                },
            },
        })
    end,
}

