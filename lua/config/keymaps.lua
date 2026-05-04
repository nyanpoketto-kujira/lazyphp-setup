-- Pindahin menu Lazy biar nggak bentrok sama Laravel
vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })
