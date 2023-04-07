local modules = {
    "options",
    "mappings",
    "plugins",
}

for i = 1, #modules do
    local ok, err = pcall(require, modules[i])
    if not ok then
        error("Error loading module " .. modules[i] .. ": " .. err)
    end
end

