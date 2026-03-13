local ns = vim.api.nvim_create_namespace("cmdline")
local buf = vim.api.nvim_create_buf(false, true)
local win, cursor, state = nil, nil, {}

local function open()
  if win and vim.api.nvim_win_is_valid(win) then return end
  local w = math.floor(vim.o.columns * 0.5)
  win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    row = math.floor((vim.o.lines - 3) / 2),
    col = math.floor((vim.o.columns - w) / 2),
    width = w, height = 1,
    style = "minimal", border = vim.g.border_style or "rounded", zindex = 250,
  })
  vim.wo[win].wrap = false
  vim.wo[win].sidescrolloff = 10
  vim.bo[buf].filetype = "vim"
  cursor = vim.o.guicursor ~= "" and vim.o.guicursor or "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
  vim.o.guicursor = "a:CursorHidden"
end

local function close()
  if state.level and state.level > 1 then return end
  vim.schedule(function()
    pcall(vim.api.nvim_win_close, win, true)
    win = nil
    if cursor then vim.o.guicursor = cursor end
    vim.cmd("redraw")
  end)
end

local function draw()
  if not state.content then return end
  local txt = ""
  for _, p in ipairs(state.content) do txt = txt .. p[2] end

  local fc = state.firstc or ""
  local display = fc ~= "" and (fc .. " " .. txt) or txt
  local offset = fc ~= "" and #fc + 1 or 0

  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { display })
  if fc ~= "" then vim.api.nvim_buf_add_highlight(buf, ns, "Special", 0, 0, #fc) end

  local pos = state.position + offset
  if pos >= #display then
    vim.api.nvim_buf_set_extmark(buf, ns, 0, #display, { virt_text = { { " ", "Cursor" } }, virt_text_pos = "inline" })
  else
    local before = display:sub(1, pos)
    vim.api.nvim_buf_add_highlight(buf, ns, "Cursor", 0, pos, #vim.fn.strcharpart(display, 0, vim.fn.strchars(before) + 1))
  end
end

vim.ui_attach(ns, { ext_cmdline = true }, function(event, ...)
  if event == "cmdline_show" then
    local content, pos, firstc, prompt, indent, level = ...
    state = { content = content, position = pos, firstc = firstc, prompt = prompt, indent = indent, level = level }
    open()
    draw()
    vim.api.nvim__redraw({ win = win, flush = true })
  elseif event == "cmdline_hide" then
    close()
  elseif event == "cmdline_pos" then
    state.position = (...)
    draw()
    vim.api.nvim__redraw({ win = win, flush = true })
  end
end)
