(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name))))))))

;plugins managed by packer
(use
  ;plugin Manager
  :wbthomason/packer.nvim {}
  ;nvim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}
  ;status line
  :hoob3rt/lualine.nvim {:mod :lualine}
  ;theme
  :projekt0n/github-nvim-theme {:mod :theme}
  :ryanoasis/vim-devicons {}
  ;file exploration
  :preservim/nerdtree {:mod :nerdtree}
  :Xuyuanp/nerdtree-git-plugin {}
  ;commeting code
  :preservim/nerdcommenter {}
  ;clojure
  :Olical/conjure {:branch :master :mod :conjure}
  ; multicursor selector
  :mg979/vim-visual-multi {:commit "46c082aad84fd83c3c3d962c65afa800c2c33d85"}
  ;text alignment
  :junegunn/vim-easy-align {:mod :easy-align}
  ;git helper
  :tpope/vim-fugitive {}
  ;sexp
  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-repeat {}
  :tpope/vim-surround {}
  ;tmux
  :christoomey/vim-tmux-navigator {:mod :tmux-navigator}
  :melonmanchan/vim-tmux-resizer {}
  ;file searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}
  ;parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter})
