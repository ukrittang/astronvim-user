local present, n = pcall(require, "null-ls")
if not present then return end

local sources = {
  n.builtins.formatting.gdformat,
  n.builtins.formatting.prettierd,
  n.builtins.diagnostics.eslint_d.with {
    diagnostics_format = "[eslint] #{m}\n(#{c})",
  },
}

return {
  debug = true,
  sources = sources,
}
