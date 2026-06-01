local dap = require("dap")
local dapui = require("dapui")
local dap_dotnet = require("nvim-dap-dotnet")
dapui.setup()


dap.adapters.netcoredbg = { type = "executable", command = "netcoredbg", args = { "--interpreter=vscode" }, }
dap.configurations.cs = {
    {
        type = "netcoredbg",
        name = "Auto Run Artifact",
        request = "launch",
        program = function()
            return
                dap_dotnet.build_artifact_dll_path()
        end,
        cwd = "${fileDirname}",
        env = {
            ASPNETCORE_ENVIRONMENT = "Development",
            ASPNETCORE_HOSTINGSTARTUPASSEMBLIES =
            "Microsoft.AspNetCore.Watch.BrowserRefresh;Microsoft.AspNetCore.SpaProxy;Microsoft.WebTools.BrowserLink.Net",
            ASPNETCORE_HTTPS_PORT = "5001",
            ASPNETCORE_URLS = "https://localhost:5001;http://localhost:5000",
        },
    },
    {
        type = "netcoredbg",
        name = "Godot: Run Project",
        request = "launch",
        program = function()
            return vim.env.GODOT;
        end,
        args = function()
            return {
                "--headless",
                "--path",
                "${fileDirname}",
            }
        end,
        cwd = "${fileDirname}",
        env = {},
    },
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
