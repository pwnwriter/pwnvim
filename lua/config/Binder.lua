---@class Binder
---@field private modes string[]
---@field private buffer integer
---@field private remap boolean
---@field private expr boolean
---@field private desc string
local Binder = {}

---@return Binder
function Binder.new() return setmetatable({}, { __index = Binder }) end

---@return Binder
function Binder:clone() return vim.deepcopy(self) end

---@param modes string[]
---@return Binder
function Binder:with_modes(modes)
  self.modes = modes
  return self
end

---@param buffer integer
---@return Binder
function Binder:with_buffer(buffer)
  self.buffer = buffer
  return self
end

---@return Binder
function Binder:with_remap()
  self.remap = true
  return self
end

---@return Binder
function Binder:with_expr()
  self.expr = true
  return self
end

---@param desc string
---@return Binder
function Binder:with_desc(desc)
  self.desc = desc
  return self
end

---@param lhs string
---@param rhs string|fun(): string|nil
---@param ... any
function Binder:bind(lhs, rhs, ...)
  if type(rhs) == "function" then
    local fn = rhs
    local params = { ... }
    rhs = function() return fn(unpack(params)) end
  end

  vim.keymap.set(self.modes, lhs, rhs, {
    buffer = self.buffer,
    remap = self.remap,
    expr = self.expr,
    desc = self.desc,
  })
end

---@param lhs string
---@return boolean
function Binder:unbind(lhs)
  local ok = pcall(vim.keymap.del, self.modes, lhs, { buffer = self.buffer })
  return ok
end

return Binder
