filetype plugin indent on
set nocompatible
syntax enable
set mouse=a
call plug#begin('~/.local/share/nvim/site')
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/which-key.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'is0n/jaq-nvim'
Plug 'w0ng/vim-hybrid'
Plug 'windwp/nvim-ts-autotag'
Plug 'Pocco81/AutoSave.nvim'
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'TimUntersberger/neogit'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ellisonleao/glow.nvim'
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
Plug 'junegunn/fzf.vim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'p00f/nvim-ts-rainbow'
Plug 'karb94/neoscroll.nvim'
Plug 'yamatsum/nvim-cursorline'
Plug 'SmiteshP/nvim-gps'
Plug 'beauwilliams/statusline.lua'
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hkupty/iron.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/paredit.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ervandew/supertab'
Plug 'danilo-augusto/vim-afterglow'
Plug 'lervag/vimtex'
Plug 'netsgnut/arctheme.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'SirVer/ultisnips'
Plug 'xolox/vim-misc'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
call plug#end()
set background=dark
colorscheme hybrid 
set smartcase 
set smarttab 
let g:rehash256 = 1
let g:tex_flavor = 'latex' 
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
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
let mapleader = ','
let maplocalleader = ','
nnoremap <Leader>s :split<CR>
nnoremap <Leader>m :VimtexCompile<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>f :CHADopen<CR>
let g:dashboard_default_executive ='telescope'
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
      -- { name = 'luasnip' }, -- For luasnip users.
       { name = 'ultisnips' }, -- For ultisnips users.
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)
local lsp_installer = require("nvim-lsp-installer")


require'lspconfig'.html.setup {
  capabilities = capabilities,
}
local neogit = require('neogit')
neogit.setup {}

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

require('jaq-nvim').setup{
    cmds = {
        default = float,
        external = {
            python = "python %",
            cpp = "g++ % -o $fileBase && /$fileBase"}},
        ui = {
            startinsert = true,
            float = {
                border ="solid",
                blend = 1}}}
require('telescope').setup{}
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
require("which-key").setup{}
require'colorizer'.setup()
EOF
set clipboard=unnamedplus
let g:neovide_cursor_vfx_mode = "railgun"
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab 
set softtabstop=4 
noremap <leader>c :lua vim.lsp.buf.formatting()<CR>
inoremap jj <esc>
luafile $HOME/.config/nvim/plugins.lua
let g:ale_fixers = {'python': ['autopep8'],
            \           'javascript': ['eslint'],
            \        }
let g:ale_fix_on_save = 1
tnoremap <Esc> <C-\><C-n>
