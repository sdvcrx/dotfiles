;;; ../.dotfiles/doom.d/+extra.el -*- lexical-binding: t; -*-

(use-package! screenshot
  :defer t)

(use-package! wakatime-mode
  :hook (doom-first-buffer . global-wakatime-mode))

(use-package! go-impl
  :after go-mode)
