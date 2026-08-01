return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local db = require("dashboard")

      db.setup({
        theme = "doom",

        config = {
          header = {
          "     ",
          "     ",
          "     ",
          "                                                                     ",        
          "       ████ ██████           █████      ██                      ",
          "      ███████████             █████                              ",
          "     █████████ ███████████████████ ███   ███████████   ",
          "    █████████  ███    █████████████ █████ ██████████████   ",
          "   █████████ ██████████ █████████ █████ █████ ████ █████   ",
          " ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
          "██████  █████████████████████ ████ █████ █████ ████ ██████ ",
          "     ",
          "     ",
          "     ",
          },

			center = {
			  {
				icon = "󰈞 ",
				desc = "Find File",
				key = "f",
				keymap = "SPC f f",
				action = "Telescope find_files",
			  },
			  {
				icon = "󰱼 ",
				desc = "Recent Files",
				key = "r",
				keymap = "SPC f r",
				action = "Telescope oldfiles",
			  },
			  {
				icon = "󰉋 ",
				desc = "Open Config",
				key = "c",
				keymap = "SPC c",
				action = "Telescope find_files cwd=~/.config/nvim",
			  },
			  {
				icon = "󰉋 ",
				desc = "Open Projects",
				key = "p",
				keymap = "SPC p",
				action = "Telescope find_files cwd=~/Projects",
			  },
			},

          footer = {},
        },
      })
    end,
  },
}
