local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
    if require("luasnip").expand_or_jumpable() then
        return t "<cmd>lua require'luasnip'.expand_or_jump()<Cr>"
    else check_back_space()
        return t "<C-j>"
    end
end

_G.s_tab_complete = function()
    if require("luasnip").jumpable(-1) then
        return t "<cmd>lua require'luasnip'.jump(-1)<CR>"
    else
        return t "<C-k>"
    end
end
