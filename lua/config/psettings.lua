local telescope_builin = require("telescope.builtin")

vim.api.nvim_create_user_command("OpenDotfilesConfig", function()
	local root = vim.fn.expand("~/dotfiles")
	vim.fn.chdir(root)
	telescope_builin.find_files({ cwd = root, hidden = true })
end, {})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰞏 ",
		},
	},
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
