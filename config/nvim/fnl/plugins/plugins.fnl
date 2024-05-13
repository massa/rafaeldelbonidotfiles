[; git helper
 {1 :tpope/vim-fugitive}
 ; commeting code
 {1 :numToStr/Comment.nvim
  :opts {:toggler {:line :<leader>cc :block :<leader>cb}
         :opleader {:line :<leader>cc :block :<leader>cb}
         :extra {:above :<leader>cO :below :<leader>co :eol :<leader>cA}}}
 ; mason
 {1 :williamboman/mason.nvim
  :lazy false
  :init (fn []
          (let [mason (require :mason)] (mason.setup)))}
 {1 :williamboman/mason-lspconfig.nvim
  :dependencies [:williamboman/mason.nvim]
  :lazy false
  :init (fn []
          (let [mason-lspconfig (require :mason-lspconfig)]
            (mason-lspconfig.setup {:ensure_installed [:lua_ls
                                                       :rust_analyzer
                                                       :raku_navigator
                                                       :fennel_language_server]
                                    :automatic_installation true
                                    :handlers {:1 (fn [server_name]
                                                    (let [lsp (require :lspconfig)
                                                          server (: lsp server_name)]
                                                      (server.setup {})))}})
            (mason-lspconfig.setup_handlers {})))}
 ; multicursor selector
 {1 :mg979/vim-visual-multi}
 ; fennel indent
 {1 :bakpakin/fennel.vim :lazy true :ft [:fennel]}
 ; jannet
 {1 :bakpakin/janet.vim :lazy true :ft [:janet]}]
