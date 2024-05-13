(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

;generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})

;clear highlighting on enter in normal mode
(nvim.set_keymap :n :<CR> ":noh<CR><CR>" {:noremap true})

;duplicate currents panel in a new tab
(nvim.set_keymap :n :<C-w>T ":tab split<CR>" {:noremap true :silent true})

;escape from terminal normal mode
(nvim.set_keymap :t :<esc><esc> "<c-\\><c-n>" {:noremap true})

(nvim.set_keymap :n :<F2> "<cmd>write<CR>" {:noremap true})
(nvim.set_keymap :i :<F2> "<Esc><cmd>write<CR>" {:noremap true})
(nvim.set_keymap :n :<F3> "<cmd>quitall<CR>" {:noremap true})
(nvim.set_keymap :i :<F3> "<Esc><cmd>quitall<CR>" {:noremap true})
(nvim.set_keymap :n :<F4> "<cmd>quit<CR>" {:noremap true})
(nvim.set_keymap :i :<F4> "<Esc><cmd>quit<CR>" {:noremap true})

{}
