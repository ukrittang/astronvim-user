local present, catppuccin = pcall(require, "catppuccin.groups.integrations.bufferline")
if not present then return end

return {
      highlights = catppuccin.get(),
}
