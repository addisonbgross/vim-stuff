set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require'nvim-web-devicons'.setup()
lua require'gitsigns'.setup()

lua <<EOF
require'nvim-tree'.setup {
  respect_buf_cwd = true,
  renderer = {
    highlight_git = true,
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "go",
    "hcl",
    "html",
    "json",
    "make",
    "scss"
  },
  sync_install = false,

  indent = {
    enable = false,
  },

  highlight = {
    enable = true,
  },
}
EOF

lua <<EOF
vim.cmd [[highlight IndentBlanklineIndent guifg=#343434 gui=nocombine]]
require("indent_blankline").setup {
  char_highlight_list = {
      "IndentBlanklineIndent",
  },
  show_current_context = true,
}
EOF

lua << EOF
require("nvim-autopairs").setup {}
EOF
