(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

;symbols to show for lsp diagnostics
(fn define-signs [prefix]
  (let [error (.. prefix :SignError)
        warn (.. prefix :SignWarn)
        info (.. prefix :SignInfo)
        hint (.. prefix :SignHint)]
    (vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn {:text "" :texthl warn})
    (vim.fn.sign_define info {:text "" :texthl info})
    (vim.fn.sign_define hint {:text "" :texthl hint})))

(define-signs :Diagnostic)

[{1 :neovim/nvim-lspconfig
  :dependencies [:williamboman/mason.nvim :williamboman/mason-lspconfig.nvim]}]
