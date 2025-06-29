return {
{
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
config = function()
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = {
	      ""
            -- "                                                     ",
            -- "  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ",
            -- "  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ",
            -- " ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ",
            -- " ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ",
            -- " ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ",
            -- " ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ",
            -- " ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ",
            -- "    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ",
            -- "          ░    ░  ░    ░ ░        ░   ░         ░    ",
            -- "                                 ░                   ",
            -- "                                                     "
          },
          center = {
            { icon = " ", key = "f", desc = "Find File", action = "Telescope find_files" },
            { icon = " ", key = "n", desc = "New File",
               action = function()
                 local filename = vim.fn.input({
                   prompt = "Введите имя файла: ",
                   default = "",
                   completion = "file"
                 })

                 if filename and filename ~= "" then
                   -- Создаем директории, если они не существуют
                   local dir = vim.fn.fnamemodify(filename, ":h")
                   if dir ~= "." and vim.fn.isdirectory(dir) == 0 then
                     vim.fn.mkdir(dir, "p")
                   end

                   -- Открываем новый файл
                   vim.cmd("edit " .. filename)
                   vim.notify("Создан новый файл: " .. filename, vim.log.levels.INFO)
                 end
               end
            },
            { icon = " ", key = "g", desc = "Find Text", action = "Telescope live_grep" },
            { icon = " ", key = "r", desc = "Recent Files", action = "Telescope oldfiles" },
            { icon = "󰒓 ", key = "c", desc = "Edit Config", action = "edit $MYVIMRC" },
            { icon = "󱏒 ", key = "<C-n>", desc = "File Explorer (NvimTree)", action = "NvimTreeToggle" },
            { icon = " ", key = "q", desc = "Quit", action = "qa" },
          },
          footer = function()
	      return {}
          end,
          vertical_center = true,
          header_highlight = "DashboardHeader",
          footer_highlight = "DashboardFooter"
        }
      })
    end
}
}
