-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<C-t>", function() Snacks.terminal(nil, {}) end, { desc = "Toggle Terminal" })
map("n", "<C-e>", function() Snacks.explorer({}) end, { desc = "Snacks File Explorer (Root Dir)" })

map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
