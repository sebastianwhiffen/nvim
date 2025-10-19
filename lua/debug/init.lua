require("debug.c")

local dap = require("dap")
local dapui =  require("dapui")
local keymaps = require("config.keymaps")

dapui.setup({
  layouts = {
    {
      -- left side
      elements = {
        { id = "scopes"},
        -- { id = "breakpoints", size = 0.25 },
        -- { id = "stacks", size = 0.25 },
        -- { id = "watches", size = 0.75 },
      },
      size = 10, -- columns
      position = "left",
    },
    {
      -- bottom panel
      elements = {
        { id = "repl", size = 0.8},
        -- { id = "console", size = 0.5 },
      },
      size = 10, -- height in lines
      position = "bottom",
    },
  },
  floating = { border = "rounded" },
})


dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	-- dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	-- dapui.close()
end
