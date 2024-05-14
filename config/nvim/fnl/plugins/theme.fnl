(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :catppuccin/nvim
  :lazy false
  :priority 1000
  :dependencies [:nvim-tree/nvim-web-devicons]
  :opts {:transparent_background true}
  :config (fn [] (vim.cmd "colorscheme catppuccin-mocha"))}]
