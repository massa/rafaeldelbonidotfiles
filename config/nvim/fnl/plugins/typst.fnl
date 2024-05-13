(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :kaarmu/typst.vim
  :ft :typst
  :lazy false
  :init (fn []
          (set nvim.g.typst_conceal 1)
          (set nvim.g.typst_conceal_math 1)
          (set nvim.g.typst_conceal_emoji 1))}]
