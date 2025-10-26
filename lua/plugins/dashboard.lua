return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local header = vim.fn.readfile(vim.fn.expand("~/dotfiles/.assets/ansinascii/nvim.txt"))
    require("dashboard").setup({
      theme = "hyper",
      shortcut_type = true,
      config = {
        header = header,
        packages = { enable = true },
        week_header = {
          enable = true
        },
        shortcut = {
          { desc = " dotfiles ", group = "Label", action = "OpenDotfilesConfig", key = "d" },
        },
        project = {
          enable = true,
          limit = 5,
          icon = '  ',
          label = 'projectos recientes',
          action = "Telescope find_files cwd="
        },
        mru = {
          enable = true,
          limit = 5,
          icon = '  ',
          label = "Archivos recientes",
          cwd_only = true
        },
        footer = {
        },
      },
      hide = {
        lualine = true
      },
    })
  end
}
