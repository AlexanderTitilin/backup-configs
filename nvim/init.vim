filetype plugin indent on
set nocompatible
syntax enable
set mouse=a
call plug#begin('~/.local/share/nvim/site')
Plug 'f-person/git-blame.nvim'
Plug 'alec-gibson/nvim-tetris'
Plug 'junegunn/fzf.vim'
Plug 'glepnir/dashboard-nvim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'p00f/nvim-ts-rainbow'
Plug 'karb94/neoscroll.nvim'
Plug 'yamatsum/nvim-cursorline'
Plug 'SmiteshP/nvim-gps'
Plug 'beauwilliams/statusline.lua'
Plug 'marko-cerovac/material.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ThePrimeagen/vim-be-good'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kristijanhusak/orgmode.nvim'
Plug 'hkupty/iron.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'neovimhaskell/haskell-vim'
Plug 'brtastic/vim-vorg'
Plug 'johngrib/vim-game-snake'
Plug 'ajh17/spacegray.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'shougo/neco-vim'
Plug 'alec-gibson/nvim-tetris'
Plug 'kovisoft/slimv'
Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/paredit.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ervandew/supertab'
Plug 'wlangstroth/vim-racket'
Plug 'danilo-augusto/vim-afterglow'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'netsgnut/arctheme.vim'
Plug 'python-mode/python-mode'
Plug 'arcticicestudio/nord-vim'
Plug 'SirVer/ultisnips'
Plug 'dylanaraps/wal'
Plug 'cocopon/iceberg.vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
set background=dark
colorscheme material  
set smartcase 
set smarttab 
let g:rehash256 = 1
let g:tex_flavor = 'latex' 
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
set number 
set relativenumber
set termguicolors
set guifont=Hack\ Nerd\ Font\ Mono:h17
let g:notes_suffix = '.txt'
let g:Powerline_symbols='unicode' 
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
set guioptions+=m
let g:paredit_electric_return=0
let g:cursorword_highlight = 1
let g:dashboard_default_executive ='fzf'
let g:slimv_preferred = 'sbcl'
let g:slimv_menu = 1
let g:neovide_cursor_vfx_mode = "sonicboom"
let mapleader = ','
lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  rainbow = {
	  enable = true,
	  extended_mode = true,
	  max_file_lines = nil,},
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/notes'},
  org_default_notes_file = '~/notes/notes.org',
})
EOF
lua require('neoscroll').setup()
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))
