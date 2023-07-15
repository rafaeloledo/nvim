local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
}

local wk = require("which-key")

wk.register({
  ["<C-w>o"] = { "<cmd>ZenMode<cr>", "Zen Mode" }
})
