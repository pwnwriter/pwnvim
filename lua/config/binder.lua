---@class binder
---@field private modes string[]
---@field private buffer integer
---@field private remap boolean
---@field private expr boolean
---@field private desc string
local binder = {}

---@return binder
function binder.new()
  return setmetatable({}, { __index = binder })
end

---@return binder
function binder:clone()
  return vim.deepcopy(self)
end

---@param modes string[]
---@return binder
function binder:with_modes(modes)
  self.modes = modes
  return self
end

---@param buffer integer
---@return binder
function binder:with_buffer(buffer)
  self.buffer = buffer
  return self
end

---@return binder
function binder:with_remap()
  self.remap = true
  return self
end

---@return binder
function binder:with_expr()
  self.expr = true
  return self
end

---@param desc string
---@return binder
function binder:with_desc(desc)
  self.desc = desc
  return self
end

---@param lhs string
---@param rhs string|fun(): string|nil
---@param ... any
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

---@param lhs string
---@return boolean
function binder:unbind(lhs)
  local ok = pcall(vim.keymap.del, self.modes, lhs, { buffer = self.buffer })
  return ok
end

return binder
