[{1 :stevearc/conform.nvim
  :dependencies [:williamboman/mason.nvim
                 :williamboman/mason-lspconfig.nvim
                 :neovim/nvim-lspconfig]
  :lazy true
  :cmd :ConformInfo
  :keys [{1 :<leader>cF
          2 (fn []
              (let [conform (require :conform)]
                (conform.format {:formatters [:injected] :timeout_ms 3000})))
          :mode [:n :v]
          :desc "Format Injected Langs"}
         {1 :<leader>cf
          2 (fn []
              (let [conform (require :conform)]
                (conform.format {})))
          :mode [:n :v]
          :desc "Format Injected Langs"}]
  :opts {:format {:timeout_ms 3000
                  :async false
                  :quiet false
                  :lsp_fallback true}
         :formatters_by_ft {:sql [:sql_formatter]
                            :javascript [:prettier]
                            :javascriptreact [:prettier]
                            :typescript [:prettier]
                            :typescriptreact [:prettier]
                            :vue [:prettier]
                            :css [:prettier]
                            :scss [:prettier]
                            :less [:prettier]
                            :html [:prettier]
                            :json [:prettier]
                            :jsonc [:prettier]
                            :yaml [:prettier]
                            :markdown [:prettier]
                            :markdown.mdx [:prettier]
                            :graphql [:prettier]
                            :handlebars [:prettier]
                            :fennel [:fnlfmt]}
         :formatters {:injected {:options {:ignore_errors true}}
                      :fnlfmt {:inherit false
                               :args ["-"]
                               :command :/home/h/.usr/bin/fnlfmt}
                      :sql_formatter {:prepend_args [:-c
                                                     :/home/h/.config/sql-formatter.json]}
                      :shfmt {:prepend_args [:-i :2]}}}}]
