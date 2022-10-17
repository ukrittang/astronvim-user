local present, n = pcall(require, "null-ls")
if not present then return end

local sources = {
  n.builtins.formatting.gdformat,
}

return {
  debug = true,
  sources = sources,
}
