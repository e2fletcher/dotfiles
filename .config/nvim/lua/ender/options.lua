vim.g.mapleader = " "
vim.g.snippets = "luasnip"

vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.cursorline = true
vim.opt.conceallevel = 3
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.showmode = false
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autowrite = true
vim.opt.list = true
vim.opt.listchars = "tab:\\ ,trail:-"
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"

if vim.fn.has("nvim-0.9.0") == 1 then
    vim.opt.splitkeep = "screen"
    vim.opt.shortmess = "filnxtToOFWIcC"
end


vim.opt.number = true
vim.opt.relativenumber = true

-- highlight matching parenthesis
vim.opt.showmatch = true

-- set case insensitive searching
vim.opt.ignorecase = true
-- case sensitive searching when not all lowercase
vim.opt.smartcase = true
-- Live replacing using %s/text/newText
vim.opt.inccommand = "split"

-- Always show signcolumns
vim.opt.signcolumn = "yes"

vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'es' }
