local modules = {
  "config.opts",
  "config.lazy",
  "config.keys",
}

for _, module in ipairs(modules) do
  require(module)
end

