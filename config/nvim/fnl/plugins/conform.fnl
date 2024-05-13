[{1 :stevearc/conform.nvim
  :dependencies [:williamboman/mason.nvim
                 :williamboman/mason-lspconfig.nvim
                 :neovim/nvim-lspconfig
                 ]
  :opts {:formatters_by_ft {[:sql] [:sql_formatter]
                            [:javascript
                             :javascriptreact
                             :typescript
                             :typescriptreact
                             :vue
                             :css
                             :scss
                             :less
                             :html
                             :json
                             :jsonc
                             :yaml
                             :markdown
                             :markdown.mdx
                             :graphql
                             :handlebars] [:prettier]
                            }
         }
  :formatters {
               :sql_formatter {
                               :prepend_args ["-c" "/home/h/.config/sql-formatter.json"]
                               }
               :shfmt {
                       :prepend_args [ "-i" "2" ]
                       }
               }
  }]
