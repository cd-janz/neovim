return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "nvim-telescope/telescope-fzy-native.nvim",
    "sharkdp/fd",
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      branch = "main",
      build = ":TSUpdate",
      opts = {
        ensure_installed = {
          "lua",
          "ini",
        },
        highlight = { enable = true },
        indent = { enable = true },
      },
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      extensions = {
        fzy_native = {
          fuzzy = true,
          override_generic_sorter = true,
          overrride_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    telescope.load_extension("fzy_native")
  end,
}
