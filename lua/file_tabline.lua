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
