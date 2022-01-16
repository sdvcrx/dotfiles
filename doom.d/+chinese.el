;;; ../.dotfiles/doom.d/+chinese.el -*- lexical-binding: t; -*-

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'posframe)
  ;; https://github.com/DogLooksGood/emacs-rime#%E4%B8%B4%E6%97%B6%E8%8B%B1%E6%96%87%E6%A8%A1%E5%BC%8F
  (rime-disable-predicates
   '(rime-predicate-evil-mode-p
     rime-predicate-after-alphabet-char-p
     rime-predicate-prog-in-code-p))
  (rime-user-data-dir "~/.local/share/fcitx5/rime"))
