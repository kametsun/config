-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ターミナルを開く
-- Ctr + shift + @
vim.api.nvim_set_keymap("n", "<C-@>", ":terminal<CR>", { noremap = true, silent = true })
