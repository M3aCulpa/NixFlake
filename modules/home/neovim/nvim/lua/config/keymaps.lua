
-- space is leader; make it a no-op
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- word wrap aware j/k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move between windows with <ctrl> hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- keep the cursor centered
vim.keymap.set('n', "<C-d>", "<C-d>zz", { desc = "Jump down half page and place cursor in center of screen"})
vim.keymap.set('n', "<C-u>", "<C-u>zz", { desc = "Jump up half page and place cursor in center of screen"})

-- better search
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- easier indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent line(s) left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent line(s) right"})

-- paste without clobbering the register (theprimeagen)
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = "Paste and send replacing text to void buffer. Preserves text in buffer prior to paste."})

-- disable ex mode
vim.keymap.set('n', 'Q', '<nop>', { desc = "Ex mode is disabled." })

-- diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- terminal
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- search highlights
vim.keymap.set("n", "<C-;>", "<cmd>noh<cr>", { desc = "Clear highlights" })
