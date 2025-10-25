return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  version = ">=1.0.0",
  opts = {
    ignored_buftypes = {
      "nofile",
      "quickfix",
      "promp",
      "term"
    },
    ignored_filetypes = { "NvimTree" },
    default_amount = 2,
    ignored_events = {
      "BufEnter", "WInEnter"
    },
  }
}
