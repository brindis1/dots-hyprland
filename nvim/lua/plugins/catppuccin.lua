return {
	{
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
            })

            vim.cmd.colorscheme("catppuccin")

			-- Espera a que el tema termine de cargar
            vim.schedule(function()
                vim.api.nvim_set_hl(0, "LineNr", {
                    fg = "#8087a2",
                })

                vim.api.nvim_set_hl(0, "CursorLineNr", {
                    fg = "#8aadf4",
                    bold = true,
                })
			end)
		end,
    },
}
