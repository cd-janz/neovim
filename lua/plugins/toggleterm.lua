return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = 15,
    open_mapping = [[<c-`>]],
    hide_numbers = true,
    shade_terminal = true,
    start_in_insert = true,
    persist_size = true,
    persiist_mode = true,
    close_on_exit = true,
    direction = "horizontal",
    auto_scroll = true,
    shell = vim.o.shell,
  },
}
