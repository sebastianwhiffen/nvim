function _G.MyTabLine()
    local line = ""

    for i, tab in ipairs(vim.api.nvim_list_tabpages()) do
        local win = vim.api.nvim_tabpage_get_win(tab)
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)

        if name == "" then
            name = "[No Name]"
        elseif vim.bo[buf].buftype == "terminal" then
            name = "[Terminal]"
        else
            name = vim.fn.fnamemodify(name, ":t")
        end

        line = line
            .. (tab == vim.api.nvim_get_current_tabpage() and "%#TabLineSel#" or "%#TabLine#")
            .. "%" .. i .. "T "
            .. name
            .. " "
    end

    return line .. "%#TabLineFill#"
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabLine()"

vim.api.nvim_set_hl(0, "TabLineSel", {
    fg = "#F89820",
    bold = true,
})

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        vim.schedule(function()
            local original_tab = vim.api.nvim_get_current_tabpage()
            local config_dir = vim.fn.expand("~/.config/nvim")
            local init_file = config_dir .. "/init.lua"

            vim.cmd("tabnew")
            vim.cmd("tcd " .. vim.fn.fnameescape(config_dir))
            vim.cmd("edit " .. vim.fn.fnameescape(init_file))

            vim.api.nvim_set_current_tabpage(original_tab)
        end)
    end,
})
