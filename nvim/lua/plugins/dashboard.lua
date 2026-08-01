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
        theme = "hyper",

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
          },

          footer = {},
        },
      })
    end,
  },
}
