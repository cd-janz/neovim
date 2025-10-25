return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "auto",
    background = {
      light = "latte",
      dark = "macchiato"
    },
    integration = {
      cmp = true,
      gitsigns = true,
      neotree = true,
      treesitter = true,
      notify = true,
      bufferline = true
    }
  }
}
