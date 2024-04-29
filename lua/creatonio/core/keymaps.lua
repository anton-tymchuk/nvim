vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<Esc><Esc>", "<Esc>:nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [H]orizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits [E]qual size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tabs management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[T]ab [O]pen" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[T]ab Close" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[T]ab [N]ext" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[T]ab [P]revious" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Usefull keys save
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save Buffer :w" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quite Buffer :q" })

keymap.set("n", "H", "^", { desc = "Go to the Begin of the Line" })
keymap.set("n", "L", "$", { desc = "Go to the End of the Line" })

keymap.set("x", "H", "^", { desc = "Select till the Begining of the Line" })
keymap.set("x", "L", "$", { desc = "Select till the End of the Line" })

-- Define mappings for leader+j and leader+k with immediate execution
-- TODO: think if i need this
keymap.set("n", "<leader>j", ":<c-u>m .+1<CR>==", { noremap = true, silent = true })
keymap.set("n", "<leader>k", ":<c-u>m .-2<CR>==", { noremap = true, silent = true })

-- Move up and down in visual mode
keymap.set("x", "K", ":move '<-2<CR>gv=gv", {})
keymap.set("x", "J", ":move '>+1<CR>gv=gv", {})
-- Move selected lines up/down in visual mode

keymap.set("n", "U", "<C-r>") -- Undo
keymap.set("n", "D", "<cmd>t.<CR>") -- Duplicate line

keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "search and [R]eplace word under cursor" })

-- Gopher pluggins
keymap.set("n", "<leader>gsj", "<cmd>GoTagAdd json<CR>", { desc = "[G]enerate [S]truct [J]son" })
keymap.set("n", "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", { desc = "[G]enerate [S]truct [Y]aml" })
