filetype plugin on
set nocompatible
syntax on
set mouse=a
set termguicolors
set nohlsearch
call plug#begin('~/.local/share/nvim/site')
Plug 'vifm/vifm.vim'
Plug 's1n7ax/nvim-terminal'
Plug 'rafamadriz/neon'
Plug 'neovimhaskell/haskell-vim'
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
Plug 'Pocco81/AutoSave.nvim'
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'neovim/nvim-lspconfig'
Plug 'glacambre/firenvim'
Plug 'f-person/git-blame.nvim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'p00f/nvim-ts-rainbow'
Plug 'karb94/neoscroll.nvim'
Plug 'yamatsum/nvim-cursorline'
Plug 'beauwilliams/statusline.lua'
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'xolox/vim-misc'
call plug#end()
set smartcase 
set smarttab 
colorscheme neon
let g:neon_style = 'doom'
let g:neon_italic_keyword = v:true
let g:neon_italic_boolean = v:true
let g:neon_italic_function = v:true
let g:rehash256 = 1
let g:tex_flavor = 'latex' 
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_engine = 'lualatex'
 set conceallevel=1
let g:tex_conceal='abdmg' 
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:slimv_swank_cmd = ':terminal  sbcl --load ~/.local/share/nvim/site/slimv/slime/start-swank.lisp'
let g:slimv_leader = '\'
set number 
set guifont=JetBrainsMono\ Nerd\ Font:h12
let g:notes_suffix = '.txt'
let g:Powerline_symbols='unicode' 
set guioptions+=m
let g:paredit_electric_return=0
let g:cursorword_highlight = 1
let mapleader = ','
let maplocalleader = ','
nnoremap <Leader>s :split<CR>
nnoremap <Leader>m :VimtexCompile<CR>
nnoremap <Leader>w :w<CR>
let g:dashboard_default_executive ='telescope'
lua require('neoscroll').setup()
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
    ['<C-e>'] = cmp.mapping.close()
    
  },
  sources = {
    {name = 'nvim_lsp'},
    { name = 'luasnip' },
    { name = 'buffer'}
  },
}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')
require'lspconfig'.racket_langserver.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.hls.setup{}
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
local autosave = require("autosave")
require('nvim-ts-autotag').setup()
autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
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
            cpp = "g++ % -o $fileBase -O2 -lfinal && /$fileBase",
			javascript = "node %",
            scheme = "racket %",
            lisp = "sbcl --load %",
            haskell = "stack ghc  %  && $fileBase"
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

EOF
set clipboard=unnamedplus
let g:neovide_cursor_vfx_mode = "railgun"
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab 
set softtabstop=4 
noremap <leader>c :Neoformat<CR>
noremap <leader>j :tabprevious<CR>
noremap <leader>k :tabnext <CR>
noremap <leader>r :Jaq terminal<CR>
noremap <leader>t :tabnew<CR> 
noremap <leader>f :Vifm<CR>
inoremap jj <esc>
tnoremap <Esc> <C-\><C-n>
tnoremap xx <C-\><C-n>
