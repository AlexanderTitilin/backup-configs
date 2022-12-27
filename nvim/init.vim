filetype plugin on
syntax on
set mouse=nvi
set nohlsearch
set noswapfile
call plug#begin('~/.local/share/nvim/site')
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'mfussenegger/nvim-jdtls'
Plug 'jghauser/mkdir.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'smiteshp/nvim-navic'
Plug 'utilyre/barbecue.nvim'
Plug 'frabjous/knap'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'https://github.com/neovimhaskell/haskell-vim'
Plug 'Pocco81/auto-save.nvim'
Plug 'kylechui/nvim-surround'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mfussenegger/nvim-jdtls'
Plug 'chaimleib/vim-renpy'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'renerocksai/calendar-vim'
Plug 'renerocksai/telekasten.nvim'
Plug 'kdheepak/cmp-latex-symbols'
Plug 'hrsh7th/cmp-calc'
Plug 'tpope/vim-surround'
Plug 'alvarosevilla95/luatab.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'max397574/better-escape.nvim'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'm-demare/hlargs.nvim'
Plug 's1n7ax/nvim-terminal'
Plug 'rafamadriz/neon'
Plug 'kovisoft/slimv'
Plug 'mattn/emmet-vim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'onsails/lspkind-nvim'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'is0n/jaq-nvim'
Plug 'w0ng/vim-hybrid'
Plug 'windwp/nvim-ts-autotag'
Plug 'sbdchd/neoformat'
Plug 'williamboman/nvim-lsp-installer'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'neovim/nvim-lspconfig'
Plug 'f-person/git-blame.nvim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'yamatsum/nvim-cursorline'
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
call plug#end()
set smartcase 
set smarttab 
colorscheme neon
" let g:neon_italic_keyword = v:true
" let g:neon_italic_boolean = v:true
" let g:neon_italic_function = v:true
let g:rehash256 = 1
let g:tex_flavor = 'latex' 
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_engine = 'lualatex'
 set conceallevel=1
let g:tex_conceal='abdmg' 
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:slimv_swank_cmd = ':terminal  sbcl --load ~/.local/share/nvim/site/slimv/slime/start-swank.lisp'
let g:slimv_leader = '\'
set number 
set relativenumber
set guifont=JetBrainsMono\ Nerd\ Font:h13
let g:notes_suffix = '.txt'
let g:Powerline_symbols='unicode' 
" set guioptions+=m
let g:paredit_electric_return=0
let g:cursorword_highlight = 1
let mapleader = ','
let maplocalleader = ','
nnoremap <Leader>s :split<CR>
nnoremap <Leader>w :w<CR>
let g:dashboard_default_executive ='telescope'
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))
set completeopt=menu,menuone
lua << EOF

local cmp = require 'cmp'
local luasnip = require 'luasnip'
  cmp.setup.cmdline('/', {
       sources = {
      { name = 'buffer' }
    }
})
cmp.setup {
    mapping = {
    ['<C-s>'] = cmp.mapping.select_prev_item(),
    ['<C-w>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort()
    
  },
  sources = {
    {name = 'nvim_lsp'},
    { name = 'ultisnips' },
    { name = 'buffer'},
    { name = 'path' },
    {name = 'calc'},
    {name = 'latex_symbols'},
  },
}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')
require'lspconfig'.racket_langserver.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.clangd.setup{}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)
local lsp_installer = require("nvim-lsp-installer")
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require'lspconfig'.html.setup {
  capabilities = capabilities
}
end
require('nvim-ts-autotag').setup()
    

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', 
      maxwidth = 50, 

      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}
require('jaq-nvim').setup{
    cmds = {
        external = {
            python = "python %",
            cpp = "g++ % -o $fileBase -O2 -lfinal && $fileBase",
			javascript = "node %",
            scheme = "racket %",
            lisp = "sbcl --load %",
            haskell = "stack ghc  %  && ./$fileBase",
            html = "firefox %"
            },
            },
        ui = {
            startinsert = true,
            float = {
                border ="solid",
                blend = 1}}}
require('telescope').setup{}
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
require'colorizer'.setup()
require('nvim-autopairs').setup{}
require('Comment').setup()
require('nvim-terminal').setup({
    window = {
        position = 'rightbelow',
        },
})
require('hlargs').setup()
require('better_escape').setup{
    mapping = {"jj"},}
require('lualine').setup(
    {options = { theme = 'powerline'}}
)
require('luatab').setup({})
local home = vim.fn.expand("~/zettelkasten")

require('telekasten').setup({
    home = home,
    take_over_my_home = true,

    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    extension    = ".md",
})
require("nvim-tree").setup()
require("nvim-surround").setup()
require("auto-save").setup()
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        }
    }

require("barbecue").setup()

local keymap = vim.keymap.set
local saga = require('lspsaga')
saga.init_lsp_saga()
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "<leader>i", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "<leader>i", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "<leader>cn", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.neon_transparent = true
vim.cmd[[colorscheme neon]]
EOF
set clipboard=unnamedplus
let g:neovide_cursor_vfx_mode = "railgun"
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab 
set softtabstop=4 
let g:user_emmet_leader_key='<C-Z>'
noremap <Leader>c :Neoformat<CR>
noremap <Leader>j :tabprevious<CR>
noremap <Leader>k :tabnext <CR>
noremap <Leader>r :Jaq terminal<CR>
noremap <Leader>t :tabnew<CR> 
noremap <Leader>f :NvimTreeFocus<CR>
noremap <Leader>F :Telescope find_files<CR>
noremap <Leader>zn :Telekasten new_note<CR>
noremap <Leader>zf :Telekasten find_notes<CR>
noremap <Leader>zc :Telekasten show_calendar<CR>
noremap <Leader>zi :Telekasten insert_link<CR>
noremap <Leader>zg :Telekasten follow_link<CR>
tnoremap <Esc> <C-\><C-n>
hi DiagnosticError guifg=White
hi DiagnosticWarn  guifg=White
hi DiagnosticInfo  guifg=White
hi DiagnosticHint  guifg=White
let g:knap_settings = {
    \ "textopdfviewerlaunch": "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
    \ "textopdfviewerrefresh": "none",
    \ "textopdfforwardjump": "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%"
\ }
let g:dashboard_custom_header = [
   \' ███████████████████████████ ',
   \' ███████▀▀▀░░░░░░░▀▀▀███████ ',
   \' ████▀░░░░░░░░░░░░░░░░░▀████ ',
   \' ███│░░░░░░░░░░░░░░░░░░░│███ ',
   \' ██▌│░░░░░░░░░░░░░░░░░░░│▐██ ',
   \' ██░└┐░░░░░░░░░░░░░░░░░┌┘░██ ',
   \' ██░░└┐░░░░░░░░░░░░░░░┌┘░░██ ',
   \' ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██ ',
   \' ██▌░│██████▌░░░▐██████│░▐██ ',
   \' ███░│▐███▀▀░░▄░░▀▀███▌│░███ ',
   \' ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██ ',
   \' ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██ ',
   \' ████▄─┘██▌░░░░░░░▐██└─▄████ ',
   \' █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████ ',
   \' ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████ ',
   \' █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████ ',
   \' ███████▄░░░░░░░░░░░▄███████ ',
   \' ██████████▄▄▄▄▄▄▄██████████ ',
   \ ]
