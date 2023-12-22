local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- must keep plugins
    use 'romainl/vim-cool' -- removes search highlight after movement
    use 'scrooloose/nerdcommenter'
    use 'mg979/vim-visual-multi'

    -- management
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- language tools
    -- use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'mfussenegger/nvim-dap' -- debugger adapter tool

    -- editing & navigating
    -- use 'tpope/vim-surround'
    use 'justinmk/vim-sneak'
    use 'yamatsum/nvim-cursorline'
    -- use 'neoclide/coc.nvim', {'branch': 'release'}
    -- use 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
    use 'windwp/nvim-autopairs'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-cmdline'

    -- ui plugins
    use 'folke/which-key.nvim'
    use 'nvim-lualine/lualine.nvim'

    -- utility plugins
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- file browsing & operating system
    use 'mhinz/vim-startify'
    use 'nvim-telescope/telescope.nvim'
    -- use 'voldikss/vim-floaterm'

    -- git
    -- use 'tpope/vim-fugitive'
    -- use 'airblade/vim-gitgutter'

    -- colorschemes
    -- use 'jacoborus/tender'
    use 'joshdick/onedark.vim'
    -- use 'tomasr/molokai'
    use 'morhetz/gruvbox'

    -- language specific
    use 'simrat39/rust-tools.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- settings
vim.cmd([[
    set ts=4
    set sw=4
    set number
    set relativenumber
    "set autoindent
    set autochdir
    set noeb vb t_vb=  " disable error bell etc.
    set ignorecase
    set nocompatible
    set cursorline
    set completeopt=menuone,noinsert,noselect
    set mouse=a
    set nowrap
    set splitbelow
    set splitright
    set signcolumn=yes
    set termguicolors
    set expandtab
    set list
    set nofoldenable
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
]])

vim.cmd([[colorscheme onedark]])

-- mappings
vim.g.mapleader = ','

local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
    map('n', shortcut, command)
end

local function imap(shortcut, command)
    map('i', shortcut, command)
end

local function vmap(shortcut, command)
    map('v', shortcut, command)
end

nmap("Y", "y$") -- yank to end of line
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

nmap("<leader>k", ":m .-2<CR>==")
nmap("<leader>j", ":m .+1<CR>==")
nmap("<CR>", "o<Esc>")

-- quickfix list
nmap("<leader>co", ":copen<CR>")
nmap("<down>", ":cn<CR>zz")
nmap("<up>", ":cp<CR>zz")
nmap("<right>", ":cc<CR>zz")
nmap("<leader>cl", ":cclose<CR>")

-- scroll
nmap("J", "5<C-e>")
nmap("K", "5<C-y>")

-- search with vimgrep
nmap("<F4>", ':execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>')
nmap("<F3>", ":vimgrep //j **<left><left><left><left><left>")

-- change windows
nmap("H", "<C-w>h")
nmap("L", "<C-w>l")

nmap("<leader>w", "<Esc>:w<CR>")
nmap("<leader>q", "<Esc>:q<CR>")

vmap("<leader>.", "<Esc>")
vmap("<", "<gv")
vmap(">", ">gv")
vmap("<C-j>", ":m '>+1<CR>gv=gv")
vmap("<C-k>", ":m '<-2<CR>gv=gv")

imap("<leader>.", "<Esc>")
imap("<S-Space>", "<Esc>la")
imap("<C-j>", "<esc>:m .+1<CR>==a")
imap("<C-k>", "<esc>:m .-2<CR>==a")

-- plugin mappings
-- Telescope
nmap("<leader>ff", "m'<cmd>Telescope find_files<CR>")
nmap("<leader>fg", "m'<cmd>Telescope live_grep<CR>")
nmap("<leader>fs", "m'<cmd>Telescope grep_string<CR>")
nmap("<leader>fb", "m'<cmd>Telescope current_buffer_fuzzy_find fuzzy=true case_mode=ignore_case<CR>")
nmap("<leader>fr", "m'<cmd>Telescope resume<CR>")
nmap("<leader>fq", "m'<cmd>Telescope quickfix<CR>")

-- LSP
nmap("<silent> gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nmap("<silent> gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
nmap("<silent> gr", "<cmd>lua vim.lsp.buf.references()<CR>")
nmap("<silent> gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")

nmap("<silent> <leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>")
nmap("<silent> <leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>")
nmap("<silent> <leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nmap("<silent> <leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
nmap("<silent> <leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
nmap("<silent> <leader>lr", ":LspRestart<CR>")

-- plugin configs
vim.g['sneak#label'] = 2

require('lualine').setup()

require("nvim-autopairs").setup {}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✅",
            package_pending = "⏳",
            package_uninstalled = "🙋‍♂️",
        },
    }
})
require("mason-lspconfig").setup()

require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "rust", "toml", "python" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

local opts = {
    tools = { -- rust-tools options

        -- how to execute terminal commands
        -- options right now: termopen / quickfix / toggleterm / vimux
        executor = require("rust-tools.executors").termopen,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,

        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },

        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {

            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            },

            -- Maximal width of the hover window. Nil means no max.
            max_width = nil,

            -- Maximal height of the hover window. Nil means no max.
            max_height = nil,

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false,
        },

        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        crate_graph = {
            -- Backend used for displaying the graph
            -- see: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- where to store the output, nil for no output stored (relative
            -- path from pwd)
            -- default: nil
            output = nil,
            -- true for all crates.io and external crates, false only the local
            -- crates
            -- default: true
            full = true,

            -- List of backends found on: https://graphviz.org/docs/outputs/
            -- Is used for input validation and autocompletion
            -- Last updated: 2021-08-26
            enabled_graphviz_backends = {
                "bmp",
                "cgimage",
                "canon",
                "dot",
                "gv",
                "xdot",
                "xdot1.2",
                "xdot1.4",
                "eps",
                "exr",
                "fig",
                "gd",
                "gd2",
                "gif",
                "gtk",
                "ico",
                "cmap",
                "ismap",
                "imap",
                "cmapx",
                "imap_np",
                "cmapx_np",
                "jpg",
                "jpeg",
                "jpe",
                "jp2",
                "json",
                "json0",
                "dot_json",
                "xdot_json",
                "pdf",
                "pic",
                "pct",
                "pict",
                "plain",
                "plain-ext",
                "png",
                "pov",
                "ps",
                "ps2",
                "psd",
                "sgi",
                "svg",
                "svgz",
                "tga",
                "tiff",
                "tif",
                "tk",
                "vml",
                "vmlz",
                "wbmp",
                "webp",
                "xlib",
                "x11",
            },
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
    }, -- rust-analyzer options

    -- debugging stuff
    dap = {
        adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
        },
    },
}

require('rust-tools').setup(opts)

-- LSP Diagnostics Options Setup
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticSignError', text = '🤬' })
sign({ name = 'DiagnosticSignWarn', text = '😱' })
sign({ name = 'DiagnosticSignHint', text = '💁' })
sign({ name = 'DiagnosticSignInfo', text = '💭' })

-- vim.diagnostic.config({
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--     underline = true,
--     severity_sort = false,
--     float = {
--         border = 'rounded',
--         source = 'always',
--         header = '',
--         prefix = '',
--     },
-- })

vim.cmd([[
  set signcolumn=yes
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' } --  'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
    set signcolumn=yes
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Completion Plugin Setup
local cmp = require('cmp')
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    -- Installed sources:
    sources = {
        { name = 'path' },                                       -- file paths
        { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
        { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
        { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
        { name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
        { name = 'calc' },                                       -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

-- LSP servers
-- require('nvim-lsp-installer').setup {}
-- local lspconfig = require("lspconfig")

-- local function on_attach(client, bufnr)
--     -- set up buffer keymaps, etc.
-- end

-- -- lua require('lspconfig').tsserver.setup{}
-- -- lua require('lspconfig').clangd.setup{}
-- lspconfig.rust_analyzer.setup {
--     on_attach = on_attach
-- }
-- -- lua require('lspconfig').jedi_language_server.setup{on_attach=on_attach}
-- lspconfig.pyright.setup { on_attach = on_attach }
