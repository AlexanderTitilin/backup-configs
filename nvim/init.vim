filetype plugin indent on
set nocompatible
syntax enable
set mouse=a
call plug#begin('~/.local/share/nvim/site')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'w0ng/vim-hybrid'
Plug 'simrat39/rust-tools.nvim'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'Olical/conjure'
Plug 'windwp/nvim-ts-autotag'
Plug 'ellisonleao/glow.nvim'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'github/copilot.vim'
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
Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/paredit.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ervandew/supertab'
Plug 'wlangstroth/vim-racket'
Plug 'danilo-augusto/vim-afterglow'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'netsgnut/arctheme.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'SirVer/ultisnips'
Plug 'cocopon/iceberg.vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
call plug#end()
set background=dark
colorscheme  dracula
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
set guifont=Hack\ Nerd\ Font\ Mono:h13
let g:notes_suffix = '.txt'
let g:Powerline_symbols='unicode' 
set guioptions+=m
let g:paredit_electric_return=0
let g:cursorword_highlight = 1
let g:dashboard_default_executive ='fzf'
let mapleader = ','
let maplocalleader = ','
nnoremap <Leader>s :split<CR>
nnoremap <Leader>m :VimtexCompile<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>f :CHADopen<CR>
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
    autotag = {
    enable = true,
  },
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
lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pylsp.setup{}
require'lspconfig'.racket_langserver.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.hls.setup{}
require('nvim-ts-autotag').setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "rust_analyzer" then
        -- Initialize the LSP via rust-tools instead
        require("rust-tools").setup {
            -- The "server" property provided in rust-tools setup function are the
            -- settings rust-tools will provide to lspconfig during init.            -- 
            -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
            -- with the user's own settings (opts).
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
        }
        server:attach_buffers()
    else
        server:setup(opts)
    end
end)
require'lspconfig'.html.setup {
  capabilities = capabilities,
}
local neogit = require('neogit')

require('rust-tools').setup({})
neogit.setup {}
EOF
set clipboard=unnamedplus
let g:neovide_cursor_vfx_mode = "railgun"
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab 
set softtabstop=4 
noremap <leader>p :Glow<CR>
noremap <leader>c :lua vim.lsp.buf.formatting()<CR>
luafile $HOME/.config/nvim/plugins.lua
let g:ale_fixers = {'python': ['autopep8'],
            \           'javascript': ['eslint'],
            \        }
let g:ale_fix_on_save = 1
let g:dashboard_custom_header =<< trim END
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``'
END
