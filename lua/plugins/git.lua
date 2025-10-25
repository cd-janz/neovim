return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  opts = {
    linehl = true,
    numhl = true,
    update_debounce = 100,
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr, vim.keymap.set(mode, l, r, opts)
      end
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
    end,
  },
}
