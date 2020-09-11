;; -*- no-byte-compile: t; -*-
;;; ~/.dotfiles/doom.d/packages.el

;; disable chinese module pinyin
(disable-packages! pyim ace-pinyin)

(package! valign :recipe (:host github :repo "casouri/valign"))

(package! rime
  :recipe (:host github :repo "DogLooksGood/emacs-rime"))
