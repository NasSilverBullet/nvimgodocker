" node plugins


" python3 plugins
call remote#host#RegisterPlugin('python3', '/root/.cache/dein/.cache/init.vim/.dein/rplugin/python3/denite', [
      \ {'sync': v:true, 'name': '_denite_init', 'type': 'function', 'opts': {}},
     \ ])
call remote#host#RegisterPlugin('python3', '/root/.cache/dein/repos/github.com/Shougo/deoplete.nvim/rplugin/python3/deoplete', [
      \ {'sync': v:false, 'name': '_deoplete_init', 'type': 'function', 'opts': {}},
     \ ])


" ruby plugins


" python plugins
