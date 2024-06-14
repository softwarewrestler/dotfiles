local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- disable arrow keys
keymap("n", "<UP>", "<Nop>", opts)
keymap("n", "<DOWN>", "<Nop>", opts)
keymap("n", "<LEFT>", "<Nop>", opts)
keymap("n", "<RIGHT>", "<Nop>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- clear hlsearch
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
--keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
--keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
--keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
--keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "[F]ind [H]elp", noremap = true, silent = true })
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "[F]ind [K]eymaps", noremap = true, silent = true })
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "[F]ind [F]iles", noremap = true, silent = true })
keymap(
	"n",
	"<leader>fs",
	":Telescope builtin<CR>",
	{ desc = "[F]ind [S]elect Telescope", noremap = true, silent = true }
)
keymap(
	"n",
	"<leader>fw",
	":Telescope grep_string<CR>",
	{ desc = "[F]ind current [W]ord", noremap = true, silent = true }
)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", { desc = "[F]ind by [G]rep", noremap = true, silent = true })
keymap(
	"n",
	"<leader>fd",
	":Telescope diagnostics<CR>",
	{ desc = "[F]ind [D]iagnostics", noremap = true, silent = true }
)
keymap("n", "<leader>fr", ":Telescope resume<CR>", { desc = "[F]ind [R]esume", noremap = true, silent = true })
keymap(
	"n",
	"<leader>f.",
	":Telescope oldfiles<CR>",
	{ desc = '[F]ind Recent Files ("." for repeat)', noremap = true, silent = true }
)
keymap(
	"n",
	"<leader><leader>",
	":Telescope buffers<CR>",
	{ desc = "[ ] Find existing buffers", noremap = true, silent = true }
)

-- Gitsigns
keymap("n", "<UP>", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<DOWN>", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)

-- Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>ef", ":NvimTreeFindFile<cr>", opts)

-- diagnostics

-- Diagnostic keymaps
vim.keymap.set(
	"n",
	"<leader>cdp",
	vim.diagnostic.goto_prev,
	{ desc = "Go to previous [C]ode [D]iagnostic [P]revious message" }
)
vim.keymap.set("n", "<leader>cdn", vim.diagnostic.goto_next, { desc = "Go to next [C]ode [D]iagnostic [N]ext message" })
vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic [C]ode [E]rror messages" })
vim.keymap.set(
	"n",
	"<leader>cdq",
	vim.diagnostic.setloclist,
	{ desc = "Open diagnostic [C]ode [D]iagnostic [Q]uickfix list" }
)
