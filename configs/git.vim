" neogit config
lua << EOF
local neogit = require("neogit")

neogit.setup {
  disable_context_highlighting = false,
  -- disable_commit_confirmation = false,
  auto_refresh = true,
  commit_popup = {
      kind = "split",
  },
  -- Change the default way of opening neogit
  kind = "tab",
  -- customize displayed signs
  signs = {
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true
  },
}
EOF
