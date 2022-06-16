set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
lua require'nvim-web-devicons'.setup()
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
lua require'gitsigns'.setup()


