;;; ../.dotfiles/doom.d/+extra.el -*- lexical-binding: t; -*-

(use-package! screenshot
  :defer t)

(use-package! wakatime-mode
  :hook (doom-first-buffer . global-wakatime-mode))

(use-package! go-impl
  :after go-mode)

(use-package! lsp-vtsls
  :after lsp-mode
  :config
  (setq
   ;; show all LSP doc on minibuffer
   lsp-eldoc-render-all t
   ;; https://github.com/yioneko/vtsls#bad-performance-of-completion
   lsp-vtsls-server-side-fuzzy-match t
   lsp-vtsls-entries-limit 10))
