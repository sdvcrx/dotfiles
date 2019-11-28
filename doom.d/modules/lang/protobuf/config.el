;;; lang/proto/config.el -*- lexical-binding: t; -*-

(use-package! protobuf-mode
  :mode "\\.proto$"
  :init
  ;; copy from spacemacs
  (setq-hook! 'protobuf-mode-hook
   imenu-generic-expression '((nil "^[[:space:]]*\\(message\\|service\\|enum\\)[[:space:]]+\\([[:alnum:]]+\\)" 2)))
  )
