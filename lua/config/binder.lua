local binder = {}

function binder.new()
  return setmetatable({}, { __index = binder })
end

function binder:clone()
  return vim.deepcopy(self)
end

function binder:with_modes(modes)
  self.modes = modes
  return self
end

function binder:with_buffer(buffer)
  self.buffer = buffer
  return self
end

function binder:with_remap()
  self.remap = true
  return self
end

function binder:with_expr()
  self.expr = true
  return self
end

function binder:with_desc(desc)
  self.desc = desc
  return self
end

function binder:bind(lhs, rhs, ...)
  if type(rhs) == "function" then
    local fn = rhs
    local params = { ... }
    rhs = function()
      return fn(unpack(params))
    end
  end

  vim.keymap.set(self.modes, lhs, rhs, {
    buffer = self.buffer,
    remap = self.remap,
    expr = self.expr,
    desc = self.desc,
    silent = true,
  })
end

function binder:unbind(lhs)
  local ok = pcall(vim.keymap.del, self.modes, lhs, { buffer = self.buffer })
  return ok
end

return binder
