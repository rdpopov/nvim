vim.pack.add({
    {src="https://github.com/folke/sidekick.nvim"}
})

require("sidekick").setup({
    mux = {
        backend = "tmux", -- default to tmux unless zellij is detected
        enabled = false,
    },
})

vim.keymap.set({ "n", "t", "i", "x" }, "<c-.>", function() require("sidekick.cli").toggle() end, { desc = "Sidekick Toggle" })
vim.keymap.set("n", "<leader>aa", function() require("sidekick.cli").toggle() end, { desc = "Sidekick Toggle CLI" })
vim.keymap.set("n", "<leader>as", function() require("sidekick.cli").select() end, { desc = "Select CLI" })
vim.keymap.set("n", "<leader>ad", function() require("sidekick.cli").close() end, { desc = "Detach a CLI Session" })
vim.keymap.set({ "x", "n" }, "<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end, { desc = "Send This" })
vim.keymap.set("n", "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, { desc = "Send File" })
vim.keymap.set("x", "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, { desc = "Send Visual Selection" })
vim.keymap.set({ "n", "x" }, "<leader>ap", function() require("sidekick.cli").prompt() end, { desc = "Sidekick Select Prompt" })
vim.keymap.set("n", "<leader>ac", function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end, { desc = "Sidekick Toggle Claude" })
