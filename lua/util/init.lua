local M = {}

function M.colorize()
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.statuscolumn = ""
  vim.wo.signcolumn = "no"
  vim.opt.listchars = { space = " " }
  vim.opt.laststatus = 0

  local buf = vim.api.nvim_get_current_buf()

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  while #lines > 0 and vim.trim(lines[#lines]) == "" do
    lines[#lines] = nil
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})

  vim.b[buf].minianimate_disable = true

  vim.api.nvim_chan_send(vim.api.nvim_open_term(buf, {}), table.concat(lines, "\r\n"))
  vim.keymap.set("n", "q", "<cmd>qa!<cr>", { silent = true, buffer = buf })
  vim.api.nvim_create_autocmd("TextChanged", { buffer = buf, command = "normal! G$" })
  vim.api.nvim_create_autocmd("TermEnter", { buffer = buf, command = "stopinsert" })

  vim.defer_fn(function()
    vim.b[buf].minianimate_disable = false
  end, 2000)
end

function M.man()
  vim.opt.laststatus = 0
  vim.opt.wrap = false
end

--[[
  Creates a table of tables from a list of strings, where each inner table 
  contains the string and enabled=false flag
  
  @param strings (table) List of strings to process
  @return (table) Table of tables, each containing a string and enabled=false
  @throws error if input is not a table or contains non-string values
--]]
function M.disable_plugins(strings)
  -- Input validation
  if type(strings) ~= "table" then
    error("Input must be a table, got " .. type(strings))
  end

  local result = {}

  for i, str in ipairs(strings) do
    -- Validate each element is a string
    if type(str) ~= "string" then
      error("All elements must be strings, got " .. type(str) .. " at index " .. i)
    end

    -- Create new table with string and enabled flag
    local entry = { str, enabled = false }
    table.insert(result, entry)
  end

  return result
end

return M
