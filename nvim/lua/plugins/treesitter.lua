return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },

        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "bash",
                    "rust",
                    "toml",
                    "json",
                    "yaml",
                    "markdown",
                    "markdown_inline",
		    "python",
                },

                auto_install = true,

                highlight = {
                    enable = true,
                },

                indent = {
                    enable = true,
                },
            })
        end,
    },  
}
