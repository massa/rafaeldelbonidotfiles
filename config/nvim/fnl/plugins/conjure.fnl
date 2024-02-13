(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :Olical/conjure
  :branch "master"
  :init (fn []
          ; Alias for ConjureShadowSelect -> Csc
          (vim.cmd {:cmd "command"
                    :args ["-nargs=1" "Csc" "ConjureShadowSelect" "<args>"]
                    :bang true})
          (set nvim.g.conjure#mapping#doc_word "K")
          (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
          (set nvim.g.conjure#client#clojure#nrepl#test#current_form_names ["deftest" "defflow" "defspec" "describe"]))}]
