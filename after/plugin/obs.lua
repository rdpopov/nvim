local obs = require "obsidian"
obs.setup( {
    legacy_commands = false,
    workspaces = {
            {
                name = "personal",
                path = "~/vaults/notes",
            },
        },
    }
)
