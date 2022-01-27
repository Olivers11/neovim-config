set laststatus=2
set showtabline=2
syntax on
set termguicolors
set winblend=0
set wildoptions=pum
set pumblend=5
set background=dark
let g:neosolarized_termtrans=1
colorscheme NeoSolarized

"=========  LIGHTLINE CONFIG ================="
let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'girl' ] ]
      \ },
      \ 'tabline':{
      \ 'colorscheme': 'PaperColor',
      \ 'left':[['tabs']],
      \ 'right': [['bufnum']]
      \ },
      \ 'separator':{
      \ 'left': '', 'right': '' 
      \ },
      \ 'subseparator':{
      \ 'left': '', 'right': ''
      \ },
      \ 'component': {
      \ 'girl': 'Daniela 💑',
      \ ' bufferline ' : ' % {bufferline # refresh_status ()}% {g: \bufferline_status_info.before}% # TabLineSel #% {g: bufferline_status_info.current}% # \LightLineLeft_active_3 #% {g: bufferline_status_info.after} '}
      \ }


"========= LSP CONFIG ==========="
lua << EOF
require'lspconfig'.pyright.setup{}
EOF





lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'sumneko_lua','rust_analyzer', 'tsserver'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF



"javascript, typescript and react support hightlightiing syntax"
let g:vim_jsx_pretty_colorful_config = 1 " default 0



"================= CONFIG FOR NERDTREE AND PLUGINS =========================== 	
let NERDTreeQuitOnOpen=1


"================= FOR DASHBOARD NEOVIM ====================================="
let g:dashboard_custom_header = [
 \ '                                        ▟▙            ',
 \ '                                        ▝▘            ',
 \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \]

let g:dashboard_default_executive = 'telescope'


"=================  TAGBAR CONFIG ===================="
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1




"		python syntax		"
let g:python_highlight_all = 1





" lua << EOF
" local lspsaga = require 'lspsaga'
" lspsaga.setup { -- defaults ...
"   debug = false,
"   use_saga_diagnostic_sign = true,
"   -- diagnostic sign
"   error_sign = "",
"   warn_sign = "",
"   hint_sign = "",
"   infor_sign = "",
"   diagnostic_header_icon = "   ",
"   -- code action title icon
"   code_action_icon = " ",
"   code_action_prompt = {
"     enable = true,
"     sign = true,
"     sign_priority = 40,
"     virtual_text = true,
"   },
"   finder_definition_icon = "  ",
"   finder_reference_icon = "  ",
"   max_preview_lines = 10,
"   finder_action_keys = {
"     open = "o",
"     vsplit = "s",
"     split = "i",
"     quit = "q",
"     scroll_down = "<C-f>",
"     scroll_up = "<C-b>",
"   },
"   code_action_keys = {
"     quit = "q",
"     exec = "<CR>",
"   },
"   rename_action_keys = {
"     quit = "<C-c>",
"     exec = "<CR>",
"   },
"   definition_preview_icon = "  ",
"   border_style = "single",
"   rename_prompt_prefix = "➤",
"   server_filetype_map = {},
"   diagnostic_prefix_format = "%d. ",
" }
" EOF

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF




