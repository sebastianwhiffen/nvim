local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.adapters.netcoredbg = { type = "executable", command = "netcoredbg", args = { "--interpreter=vscode" }, }

dap.configurations.cs = {
    {
        name = "dbg snowdrift",
        type = "netcoredbg",
        request = "launch",

        program = function()
            return os.getenv("GODOT")
        end,
        args = {
            "--path",
            os.getenv("SNOWDRIFT") .. "src/snowdrift.godot",
        },

        cwd = "${workspaceFolder}",
        stopAtEntry = false,
    },
    {
        name = "dbg dll",
        type = "netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input("path: ", vim.fn.getcwd())
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
    }
}

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end


vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F10>", function() dap.step_over() end)
vim.keymap.set("n", "<F11>", function() dap.step_into() end)
vim.keymap.set("n", "<F12>", function() dap.step_out() end)
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>du", function() dapui.toggle() end)
vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end)
vim.keymap.set("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "DAP toggle breakpoint" })
