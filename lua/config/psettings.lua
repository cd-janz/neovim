local telescope_builin = require("telescope.builtin")

vim.api.nvim_create_user_command("OpenDotfilesConfig", function()
  local root = vim.fn.expand("~/dotfiles/.config")
  vim.fn.chdir(root)
  telescope_builin.find_files({ cwd = root, hidden = true })
end, {})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = '󰞏 ',
    }
  }
})
