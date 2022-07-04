;; -*- no-byte-compile: t; -*-
;;; ~/.dotfiles/doom.d/packages.el

;; disable chinese module pinyin
(disable-packages! pyim ace-pinyin)

(package! valign :recipe (:host github :repo "casouri/valign"))

(package! rime :recipe (:host github :repo "DogLooksGood/emacs-rime"))

(package! org-appear :recipe (:host github :repo "awth13/org-appear"))
(package! org-ol-tree :recipe (:host github :repo "Townk/org-ol-tree"))

;; https://github.com/tecosaur/screenshot/issues/11
(package! screenshot :recipe (:host github :repo "tecosaur/screenshot" :build (:not compile)))

(package! wakatime-mode)

(package! protobuf-mode)
(package! go-impl)

;; org-roam-ui
(unpin! org-roam)
(package! websocket)
(package! org-roam-ui :recipe (:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))
